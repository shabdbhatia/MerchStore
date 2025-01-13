<%-- 
    Document   : payment_gateway
    Created on : Jan 13, 2025, 3:47:53 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mock Payment Gateway</title>
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

        <h2>Mock Payment Gateway</h2>
        <p>Complete your payment below:</p>

        <form action="${pageContext.request.contextPath}/processPayment" method="post">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>
            <br><br>
            
            <label for="expiry">Expiry Date:</label>
            <input type="month" id="expiry" name="expiry" required>
            <br><br>
            
            <label for="cvv">CVV:</label>
            <input type="password" id="cvv" name="cvv" placeholder="123" required>
            <br><br>
            
            <label for="amount">Amount to Pay:</label>
            <input type="number" id="amount" name="amount" step="0.01" value="<%= request.getAttribute("amount") != null ? request.getAttribute("amount") : "0.00" %>" readonly>
            <br><br>
            
            <button type="submit">Pay Now</button>
        </form>
    </body>
</html>
