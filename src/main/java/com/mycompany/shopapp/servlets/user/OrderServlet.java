/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.user;

import com.mycompany.shopapp.dao.OrderDAO;
import com.mycompany.shopapp.model.Order;
import com.mycompany.shopapp.model.OrderItem;
import com.mycompany.shopapp.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shabd
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/checkout"})
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("CartItems");
        int userId = (int) session.getAttribute("userId");

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp?error=Cart is empty");
            return;
        }

        double totalPrice = cartItems.stream()
                                     .mapToDouble(item -> item.getPrice() * item.getQuantity())
                                     .sum();

        Order order = new Order(0, userId, null, totalPrice, cartItems);
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(order);

        if (orderId > 0) {
            session.removeAttribute("CartItems");
            response.sendRedirect("orderSuccess.jsp?orderId=" + orderId);
        } else {
            response.sendRedirect("cart.jsp?error=Failed to place order");
        }
    }
}