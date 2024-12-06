<%-- 
    Document   : addUser
    Created on : Oct 24, 2024, 1:06:17 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a user</title>
    </head>
    <body>
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
            <input type="submit" value="Add User">
        </form>
    </body>
</html>