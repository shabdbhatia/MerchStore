<%-- 
    Document   : user_dashboard
    Created on : Oct 24, 2024, 12:38:56 PM
    Author     : shabd
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.shopapp.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <h2>Welcome to Our Product Catalog</h2>
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list of products from the request attribute
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (Product product : products) {
                %>
                <tr>
                    <td>
                        <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(product.getImage())%>" 
                             alt="<%= product.getName()%> Image" />
                    </td>
                    <td><%= product.getName()%></td>
                    <td><%= product.getDescription()%></td>
                    <td>₹<%= product.getPrice()%></td>
                    <td>
                        <form action="add-to-cart" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId()%>">
                            <input type="number" name="quantity" value="1" min="1" />
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
        </table>
        <a href="./Pages/Login/login.jsp">Logout</a>
    </body>
</html>
