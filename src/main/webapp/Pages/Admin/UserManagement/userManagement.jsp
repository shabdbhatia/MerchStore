<%-- 
    Document   : userManagement.jsp
    Created on : Oct 24, 2024, 1:04:18 PM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
    </head>
    <body>
        <h2>User Management</h2>
        <a href="userManagement?action=add">Add New User</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<User> users = (List<User>) request.getAttribute("users");
                    if (users != null) {
                        for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getRole() %></td>
                    <td><a href="userManagement?action=edit&id=<%= user.getId() %>">Edit</a></td>
                    <td><a href="userManagement?action=delete&id=<%= user.getId() %>" onclick="return confirm('Are you sure?')">Delete</a></td>
                </tr>
                <% 
                        }
                    } 
                %>
            </tbody>
        </table>
            
        <a href="../Pages/Admin/admin_dashboard.jsp" >Back to Admin Dashboard</a>
    </body>
</html>