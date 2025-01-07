<%-- 
    Document   : order_history
    Created on : Jan 6, 2025, 10:14:41 AM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.OrderItem"%>
<%@page import="com.mycompany.shopapp.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Order History</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>Order History</h1>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders == null || orders.isEmpty()) {
        %>
        <p>No orders found.</p>
        <%
        } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total Price</th>
                    <th>Items</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order order : orders) {
                %>
                <tr>
                    <td><%= order.getId()%></td>
                    <td><%= order.getOrderDate()%></td>
                    <td><%= order.getTotalPrice()%></td>
                    <td>
                        <ul>
                            <%
                                for (OrderItem item : order.getItems()) {
                            %>
                            <li>Product ID: <%= item.getProductId()%>, Quantity: <%= item.getQuantity()%>, Price: <%= item.getPrice()%></li>
                                <%
                                    }
                                %>
                        </ul>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>
        <a href="<%= request.getContextPath() %>/user-dashboard">Continue Shopping</a>
    </body>
</html>