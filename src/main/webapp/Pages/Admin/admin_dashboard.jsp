<%-- 
    Document   : admin_dashboard
    Created on : Oct 24, 2024, 12:38:46 PM
    Author     : shabd
--%>
<%@page import="com.mycompany.shopapp.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"A".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("../Pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link rel="stylesheet"/>
    </head>
    <body>
        <h1>Welcome, Admin</h1>
        <p>Hello, <%= user.getUsername()%>. You are logged in as an Admin.</p>
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/userManagement">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/productManagement">Manage Products</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/manage-orders">Manage Orders</a></li>
            <li><a href="/ShopApp">Logout</a></li>
        </ul>
    </body>
</html>