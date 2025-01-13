<%-- 
    Document   : payment_result
    Created on : Jan 13, 2025, 3:44:25 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Result</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/user-dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>

        <h2>Payment Status</h2>
        <p style="color: <%= "success".equals(request.getAttribute("status")) ? "green" : "red" %>;">
            <%= request.getAttribute("message") %>
        </p>

        <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Go to Dashboard</a>
    </body>
</html>
