<%-- 
    Document   : addUser
    Created on : Oct 24, 2024, 1:06:17 PM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    // Check if the user session exists and the role is admin
    User user = (User) session.getAttribute("user");
    if (user == null || !"A".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Pages/Login/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/Admin/AdminPagesStyle.css"/>
        <title>Add a user</title>
    </head>
    <body>
        
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp">Logout</a>
            </div>
        </div>
            
            
        <h2>Add User</h2>
        <form action="userManagement" method="post">
            <input type="hidden" name="action" value="add">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="A">Admin</option>
                <option value="U">User</option>
            </select>
            <br>
            <button type="submit" value="Add User">Add User</button>
        </form>
    </body>
</html>