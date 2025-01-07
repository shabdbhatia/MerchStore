<%-- 
    Document   : orderManagement
    Created on : Jan 6, 2025, 9:19:47 PM
    Author     : shabd
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.shopapp.model.OrderItem"%>
<%@page import="com.mycompany.shopapp.model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Management</title>
    </head>
    <body>
        <h2>All Orders</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<com.mycompany.shopapp.model.Order> allOrders
                            = (List<com.mycompany.shopapp.model.Order>) request.getAttribute("allOrders");

                    if (allOrders != null && !allOrders.isEmpty()) {
                        for (com.mycompany.shopapp.model.Order order : allOrders) {
                %>
                <tr>
                    <td><%= order.getId()%></td>
                    <td><%= order.getUserId()%></td>
                    <td><%= order.getOrderDate()%></td>
                    <td><%= order.getTotalPrice()%></td>
                    <td>
                        <form action="manage-orders" method="post">
                            <input type="hidden" name="orderId" value="<%= order.getId()%>">
                            <button type="submit" name="action" value="remove">Remove</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" align="center">No orders found!</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
