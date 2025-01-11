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
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/Login/LoginCss.css"/>
    </head>
    <body>
        
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
            </div>
        </div>
            
            
        <h2>Login Portal</h2>
        <form  action="${pageContext.request.contextPath}/login" method="post" id="login-container">
            <!--<label for="username">Username:</label>-->
            <input type="text" id="username" name="username" placeholder="Username" required>
            <br>
            <!--<label for="password">Password:</label>-->
            <input type="password" id="password" name="password" placeholder="Password" required>
            <br>
            <button type="submit" value="Login"/>Login</button>
        </form>
    <c:if test="${not empty errorMessage}">
        <p style="color:red">${errorMessage}</p>
    </c:if>
    
    <a href="${pageContext.request.contextPath}/Pages/Login/signup.jsp" class="link">Not a user? Sign up</a>
    </body>
</html>
