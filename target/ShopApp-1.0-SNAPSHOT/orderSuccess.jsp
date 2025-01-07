<%-- 
    Document   : orderSuccess
    Created on : Jan 5, 2025, 4:59:20 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Order Placed Successfully!</h2>
        <p>Your order ID is: <%= request.getParameter("orderId") %></p>
        <a href="<%= request.getContextPath() %>/order-history">View Order History</a>
        <a href="<%= request.getContextPath() %>/user-dashboard">Continue Shopping</a>
    </body>
</html>
