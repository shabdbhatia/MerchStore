<%-- 
    Document   : editUser
    Created on : Oct 24, 2024, 1:06:10 PM
    Author     : shabd
--%>
<%@page import="com.mycompany.shopapp.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("userManagement");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>
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
            <input type="submit" value="Update">
        </form>
    </body>
</html>