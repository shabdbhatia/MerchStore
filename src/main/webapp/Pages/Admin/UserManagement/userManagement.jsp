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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <title>User Management</title>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp">Logout</a>
            </div>
        </div>


        <h2>User Management</h2>
        <a href="userManagement?action=add"><button class='add-user-button'>Add New User</button></a>

        <div class="users-table">

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
                        <td><%= user.getId()%></td>
                        <td><%= user.getUsername()%></td>
                        <td><%= user.getRole()%></td>
                        <td><a href="userManagement?action=edit&id=<%= user.getId()%>">Edit</a></td>
                        <td><a href="userManagement?action=delete&id=<%= user.getId()%>" onclick="return confirm('Are you sure?')">Delete</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

        </div>

        <a href="../Pages/Admin/admin_dashboard.jsp" >Back to Admin Dashboard</a>
    </body>
</html>