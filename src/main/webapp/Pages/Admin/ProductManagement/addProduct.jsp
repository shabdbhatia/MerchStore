<%-- 
    Document   : addProduct
    Created on : Dec 4, 2024, 9:21:21 AM
    Author     : shabd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add Product</h2>
    <form action="productManagement" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="add">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
        <br>
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>
        <br>
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required>
        <br>
        <button type="submit">Add Product</button>
    </form>
</body>
</html>
