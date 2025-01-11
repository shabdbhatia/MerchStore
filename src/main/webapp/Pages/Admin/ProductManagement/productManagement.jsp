<%-- 
    Document   : productManagement
    Created on : Dec 4, 2024, 9:21:32 AM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/Admin/AdminPagesStyle.css"/>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/Pages/Login/login.jsp">Logout</a>
            </div>
        </div>


        <h2>Product Management</h2>
        <a href="productManagement?action=add">Add New Product</a>

        <div class='products-container'>

            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null) {
                            for (Product product : products) {
                    %>
                    <tr>
                        <td><%= product.getId()%></td>
                        <td><%= product.getName()%></td>
                        <td><%= product.getDescription()%></td>
                        <td><%= product.getPrice()%></td>
                        <td>
                            <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(product.getImage())%>" alt="Product Image" width="50" height="50"/>
                        </td>
                        <td><a href="productManagement?action=edit&id=<%= product.getId()%>">Edit</a></td>
                        <td><a href="productManagement?action=delete&id=<%= product.getId()%>" onclick="return confirm('Are you sure?')">Delete</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

        </div>
        <a href="../Pages/Admin/admin_dashboard.jsp" >Back to Admin Dashboard</a>
    </body>
</html>
