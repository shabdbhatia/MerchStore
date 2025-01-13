/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.shopapp.dao;

/**
 *
 * @author shabd
 */
import com.mycompany.shopapp.model.Order;
import com.mycompany.shopapp.model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/MerchStore";
        String user = "root";
        String password = "bshabd123";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    // Method to create a new order
    public int createOrder(Order order) {
        int orderId = -1;
        String orderSql = "INSERT INTO orders (user_id, total_price, status) VALUES (?, ?, ?)";
        String itemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);

            // Insert the order
            try (PreparedStatement orderStmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                orderStmt.setInt(1, order.getUserId());
                orderStmt.setDouble(2, order.getTotalPrice());
                orderStmt.setString(3, "Pending"); // Default status

                orderStmt.executeUpdate();

                // Get the generated order ID
                ResultSet rs = orderStmt.getGeneratedKeys();
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }

                // Insert the order items
                try (PreparedStatement itemStmt = conn.prepareStatement(itemSql)) {
                    for (OrderItem item : order.getItems()) {
                        itemStmt.setInt(1, orderId);
                        itemStmt.setInt(2, item.getProductId());
                        itemStmt.setInt(3, item.getQuantity());
                        itemStmt.setDouble(4, item.getPrice());
                        itemStmt.addBatch();
                    }
                    itemStmt.executeBatch();
                }

                conn.commit();
            } catch (Exception e) {
                conn.rollback();
                throw e;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    // Method to delete an order
    public void deleteOrder(int orderId) {
        String deleteOrderItemsSql = "DELETE FROM order_items WHERE order_id = ?";
        String deleteOrderSql = "DELETE FROM orders WHERE id = ?";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement deleteOrderItemsStmt = conn.prepareStatement(deleteOrderItemsSql)) {
                deleteOrderItemsStmt.setInt(1, orderId);
                deleteOrderItemsStmt.executeUpdate();
            }

            try (PreparedStatement deleteOrderStmt = conn.prepareStatement(deleteOrderSql)) {
                deleteOrderStmt.setInt(1, orderId);
                deleteOrderStmt.executeUpdate();
            }

            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to fetch all orders
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String orderSql = "SELECT * FROM orders";
        String itemSql = "SELECT * FROM order_items WHERE order_id = ?";

        try (Connection conn = getConnection(); PreparedStatement orderStmt = conn.prepareStatement(orderSql)) {
            ResultSet rs = orderStmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("id");
                int userId = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String status = rs.getString("status");
                Timestamp orderDate = rs.getTimestamp("order_date");

                List<OrderItem> items = getOrderItems(orderId, conn);

                orders.add(new Order(orderId, userId, orderDate, totalPrice, status, items));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    // Method to fetch orders by user ID
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String orderSql = "SELECT * FROM orders WHERE user_id = ?";
        String itemSql = "SELECT * FROM order_items WHERE order_id = ?";

        try (Connection conn = getConnection(); PreparedStatement orderStmt = conn.prepareStatement(orderSql)) {
            orderStmt.setInt(1, userId);
            ResultSet rs = orderStmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("id");
                double totalPrice = rs.getDouble("total_price");
                String status = rs.getString("status");
                Timestamp orderDate = rs.getTimestamp("order_date");

                List<OrderItem> items = getOrderItems(orderId, conn);

                orders.add(new Order(orderId, userId, orderDate, totalPrice, status, items));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    // Utility method to fetch order items
    private List<OrderItem> getOrderItems(int orderId, Connection conn) throws SQLException {
        List<OrderItem> items = new ArrayList<>();
        String itemSql = "SELECT * FROM order_items WHERE order_id = ?";

        try (PreparedStatement itemStmt = conn.prepareStatement(itemSql)) {
            itemStmt.setInt(1, orderId);
            ResultSet rs = itemStmt.executeQuery();

            while (rs.next()) {
                items.add(new OrderItem(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }
        }

        return items;
    }

    // Method to mark an order as paid
    public boolean markOrderAsPaid(int orderId) throws Exception {
        String sql = "UPDATE orders SET status = 'Paid' WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    
    }

}