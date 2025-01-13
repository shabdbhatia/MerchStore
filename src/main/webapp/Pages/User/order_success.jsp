<%-- 
    Document   : order_success
    Created on : Jan 13, 2025, 4:08:43 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Success</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/user-dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>

        <h2>Order Placed Successfully</h2>
        <p>Thank you for your purchase!</p>
        <p>Your order ID is: <%= request.getParameter("orderId") %></p>

        <a href="${pageContext.request.contextPath}/order-history">View My Orders</a>
    </body>
</html>
