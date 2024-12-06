<%-- 
    Document   : login
    Created on : Oct 24, 2024, 12:38:01 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login|Vivum 2024</title>
    </head>
    <body>
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
        </form>
    <c:if test="${not empty errorMessage}">
        <p style="color:red">${errorMessage}</p>
    </c:if>
    
    <a href="${pageContext.request.contextPath}/Pages/Login/signup.jsp" class="link">Not a user? Sign up</a>
    </body>
</html>
