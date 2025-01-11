<%-- 
    Document   : editUser
    Created on : Oct 24, 2024, 1:06:10 PM
    Author     : shabd
--%>
<%@page import="com.mycompany.shopapp.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <title>Edit User</title>
    </head>
    <body>
        
     
        
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp">Logout</a>
            </div>
        </div>
            
            
        <h2>Edit User</h2>
        <form action="userManagement" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= user.getId()%>">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= user.getUsername()%>" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword()%>" required>
            <br>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="A" <%= "A".equals(user.getRole()) ? "selected" : ""%>>Admin</option>
                <option value="U" <%= "U".equals(user.getRole()) ? "selected" : ""%>>User</option>
            </select>
            <br>
            <button type="submit" value="Update">Update</button>
        </form>
    </body>
</html>