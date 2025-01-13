<%-- 
    Document   : signup
    Created on : Oct 24, 2024, 12:38:06 PM
    Author     : shabd
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Signup</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/Login/LoginCss.css"/>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
            </div>
        </div>


        <h2>Signup</h2>

        <%-- Display error or success messages based on query parameters --%>
        <%
            String signupError = request.getParameter("error");
            String signupSuccess = request.getParameter("signup");

            if ("username_exists".equals(signupError)) {
        %>
        <p style="color: red;">Username is already taken. Please try another one.</p>
        <% } else if ("failed".equals(signupError)) { %>
        <p style="color: red;">Signup failed. Please try again later.</p>
        <% } else if ("success".equals(signupSuccess)) { %>
        <p style="color: green;">Signup successful! You can now log in.</p>
        <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp"><button>Login Here</button></a>
                <% }%>

        <form id="login-container" action="${pageContext.request.contextPath}/signup" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>

            <button type="submit">Sign Up</button>
        </form>
    </body>
</html>
