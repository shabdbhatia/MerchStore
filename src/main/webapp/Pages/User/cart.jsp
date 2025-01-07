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
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Your Cart</h2>
        <table border="1">
            <thead>
                <tr>
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
                    <td>₹<%= item.getPrice()%></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/cart" method="post" style="display: inline;">
                            <input type="number" name="quantity" value="<%= item.getQuantity()%>" min="1" />
                            <input type="hidden" name="productId" value="<%= item.getProductId()%>" />
                            <button type="submit" name="action" value="update">Update</button>
                        </form>
                    </td>
                    <td>₹<%= subtotal%></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/cart" method="post" style="display: inline;">
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
                    <td colspan="4" align="center">Your cart is empty!</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <form action="<%= request.getContextPath() %>/checkout" method="post" style="margin-top: 20px;">
            <button type="submit">Checkout</button>
        </form>
        <a href="<%= request.getContextPath() %>/user-dashboard">Continue Shopping</a>
    </body>
</html>
