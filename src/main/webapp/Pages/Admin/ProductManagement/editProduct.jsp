<%-- 
    Document   : editProduct
    Created on : Dec 4, 2024, 9:21:26 AM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.shopapp.model.Product"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit Product</h2>
    <form action="productManagement" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="<%= ((Product) request.getAttribute("product")).getId() %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= ((Product) request.getAttribute("product")).getName() %>" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required><%= ((Product) request.getAttribute("product")).getDescription() %></textarea>
        <br>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" value="<%= ((Product) request.getAttribute("product")).getPrice() %>" required>
        <br>
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*">
        <br>
        <button type="submit">Update Product</button>
    </form>
    

</body>
</html>
