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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <title>Order Management</title>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp">Logout</a>
            </div>
        </div>


        <h2>All Orders</h2>

        <div class='orders-container'>

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

        </div>

        <a href="../Pages/Admin/admin_dashboard.jsp" >Back to Admin Dashboard</a>
    </body>
</html>
