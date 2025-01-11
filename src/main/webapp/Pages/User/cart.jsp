<%-- 
    Document   : cart
    Created on : Jan 4, 2025, 8:39:21 PM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.shopapp.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/User/styling/cart_styling.css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/user-dashboard">Catalog</a>
                <a href="cart">Cart</a>
                <a href="${pageContext.request.contextPath}/order-history">Order History</a>
                <a href="./Pages/Login/login.jsp">Logout</a>
            </div>
        </div>

        <!-- Cart Heading -->
        <h1>Your Cart</h1>

        <!-- Cart Table -->
        <div class="cart-container">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("CartItems");
                        if (cartItems != null && !cartItems.isEmpty()) {
                            double total = 0.0;
                            for (OrderItem item : cartItems) {
                                double subtotal = item.getPrice() * item.getQuantity();
                                total += subtotal;
                    %>
                    <tr>
                        <td><%= item.getName()%></td>
                        <td>₹<%= item.getPrice()%></td>
                        <td>
                            <form action="<%= request.getContextPath()%>/cart" method="post">
                                <input type="number" name="quantity" value="<%= item.getQuantity()%>" min="1" />
                                <input type="hidden" name="productId" value="<%= item.getProductId()%>" />
                                <button type="submit" name="action" value="update">Update</button>
                            </form>
                        </td>
                        <td>₹<%= subtotal%></td>
                        <td class="actions">
                            <form action="<%= request.getContextPath()%>/cart" method="post">
                                <input type="hidden" name="productId" value="<%= item.getProductId()%>" />
                                <button type="submit" name="action" value="remove">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="2" align="right"><strong>Total:</strong></td>
                        <td>₹<%= total%></td>
                        <td></td>
                    </tr>
                    <%
                    } else {
                    %>
                    <tr>
                        <td colspan="4" class="empty-cart">Your cart is empty!</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <!-- Checkout and Continue Shopping -->
            <div class="checkout-container">
                <a href="<%= request.getContextPath()%>/user-dashboard"><button class="continue-button">Continue Shopping</button></a>
                <form action="<%= request.getContextPath()%>/checkout" method="post">
                    <button type="submit" class="checkout-button">Checkout</button>
                </form>
            </div>
        </div>

    </body>
</html>
