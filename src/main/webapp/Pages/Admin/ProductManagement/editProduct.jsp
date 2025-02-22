<%-- 
    Document   : editProduct
    Created on : Dec 4, 2024, 9:21:26 AM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.shopapp.model.Product"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    // Check if the user session exists and the role is admin
    User user = (User) session.getAttribute("user");
    if (user == null || !"A".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Pages/Login/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/Admin/AdminPagesStyle.css"/>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Admin Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/Pages/Admin/admin_dashboard.jsp">Admin Dashboard</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>


        <h2>Edit Product</h2>
        <form action="productManagement" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= ((Product) request.getAttribute("product")).getId()%>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= ((Product) request.getAttribute("product")).getName()%>" required>
            <br>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required><%= ((Product) request.getAttribute("product")).getDescription()%></textarea>
            <br>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" value="<%= ((Product) request.getAttribute("product")).getPrice()%>" required>
            <br>
            
            <label for="currentImage">Current Image:</label>
            <div>
                <img src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(((Product) request.getAttribute("product")).getImage()) %>" alt="Product Image" width="150" height="150"/>
            </div>
            <br>
            
            <label for="image">New Image (optional):</label>
            <input type="file" id="image" name="image" accept="image/*">
            <br>
            <button type="submit">Update Product</button>
        </form>


    </body>
</html>
