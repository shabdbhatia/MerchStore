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
            <div class="navbar-links"></div>
        </div>

        <h2>Signup</h2>

        <%-- Display error or success messages based on query parameters --%>
        <%
            String signupError = request.getParameter("error");
            String signupSuccess = request.getParameter("signup");

            if ("username_exists".equals(signupError)) {
        %>
        <p style="color: red;">Username is already taken. Please try another one.</p>
        <% } else if ("password_mismatch".equals(signupError)) { %>
        <p style="color: red;">Passwords do not match. Please try again.</p>
        <% } else if ("weak_password".equals(signupError)) { %>
        <p style="color: red;">Password must be at least 8 characters long, contain 1 digit, and 1 special character.</p>
        <% } else if ("failed".equals(signupError)) { %>
        <p style="color: red;">Signup failed. Please try again later.</p>
        <% } else if ("success".equals(signupSuccess)) { %>
        <p style="color: green;">Signup successful! You can now log in.</p>
        <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp"><button>Login Here</button></a>
        <% } %>

        <form id="login-container" action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validatePassword()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

            <p id="error-message" style="color: red;"></p>

            <button type="submit">Sign Up</button>
        </form>

        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var errorMessage = document.getElementById("error-message");

                // Regex to check password strength
                var passwordPattern = /^(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                if (!passwordPattern.test(password)) {
                    errorMessage.textContent = "Password must be at least 8 characters long, contain 1 digit, and 1 special character.";
                    return false;
                }

                if (password !== confirmPassword) {
                    errorMessage.textContent = "Passwords do not match.";
                    return false;
                }

                return true;
            }
        </script>

    </body>
</html>
