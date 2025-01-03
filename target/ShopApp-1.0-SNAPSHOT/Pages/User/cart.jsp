<%-- 
    Document   : cart
    Created on : Jan 3, 2025, 11:11:53 PM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <style>
            .cart-table {
                width: 100%;
                border-collapse: collapse;
            }
            .cart-table th, .cart-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            .product-image {
                width: 100px;
                height: auto;
            }
        </style>
    </head>
    <body>
        <h1>Your Cart</h1>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${sessionScope.cart}">
                <tr>
                    <td><img src="data:image/jpeg;base64,${fn:escapeXml(product.image)}" class="product-image" /></td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>$${product.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="user-dashboard">Continue Shopping</a>
</body>
</html>
