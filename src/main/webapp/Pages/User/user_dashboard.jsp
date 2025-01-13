<%-- 
    Document   : user_dashboard
    Created on : Oct 24, 2024, 12:38:56 PM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.shopapp.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    // Check if the user session exists and the role is admin
    User user = (User) session.getAttribute("user");
    if (user == null || !"U".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Pages/Login/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/User/styling/user_dashboard_styling.css"/>

        <title>Product Catalogue</title>

        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            img {
                max-width: 100px;
                height: auto;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Dashboard</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/user-dashboard">Catalog</a>
                <a href="cart">Cart</a>
                <a href="${pageContext.request.contextPath}/order-history">Order History</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
        <h2>Welcome to Our Product Catalog</h2>
        <!--        <table>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>-->
        <%
            // Retrieve the list of products from the request attribute
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <!--                <tr>
                            <td>
                                <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(product.getImage())%>" 
                                     alt="<%= product.getName()%> Image" />
                            </td>
                            <td><%= product.getName()%></td>
                            <td><%= product.getDescription()%></td>
                            <td>₹<%= product.getPrice()%></td>
                            <td>
                                <form action="cart" method="post">
                                    <input type="hidden" name="action" value="add" />
                                    <input type="hidden" name="productId" value="<%= product.getId()%>">
                                    <input type="hidden" name="price" value="<%= product.getPrice()%>">
                                    <input type="number" name="qty" value="1" min="1" />
                                    <button type="submit">Add to Cart</button>
                                </form>
                            </td>
                        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">No products available at the moment.</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>-->

        <div class="product-grid">
            <% if (products != null && !products.isEmpty()) {
            for (Product product : products) {%>
            <div class="product-card">
                <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(product.getImage())%>" alt="<%= product.getName()%> Image" />
                <h3><%= product.getName()%></h3>
                <p><%= product.getDescription()%></p>
                <p class="price">₹<%= product.getPrice()%></p>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="name" value="<%= product.getName()%>" />
                    <input type="hidden" name="productId" value="<%= product.getId()%>" />
                    <input type="hidden" name="price" value="<%= product.getPrice()%>" />
                    <input type="number" name="qty" value="1" min="1" />
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
            <% }
    } else { %>
            <p>No products available at the moment.</p>
            <% }%>
        </div>
    </body>
</html>