<%-- 
    Document   : order_history
    Created on : Jan 6, 2025, 10:14:41 AM
    Author     : shabd
--%>

<%@page import="com.mycompany.shopapp.model.User"%>
<%@page import="com.mycompany.shopapp.model.OrderItem"%>
<%@page import="com.mycompany.shopapp.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Order History</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/globalstyle.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/User/styling/order_history_styling.css"/>
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-brand">School Merchandise Portal</div>
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/user-dashboard">Catalog</a>
                <a href="cart">Cart</a>
                <a href="${pageContext.request.contextPath}/order-history">Order History</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>

        <h1>Order History</h1>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders == null || orders.isEmpty()) {
        %>
        <p>No orders found.</p>
        <%
        } else {
        %>


        <div class="order-table">
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Total Price</th>
                        <th>Items</th>
                        <th>Payment Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Order order : orders) {
                    %>
                    <tr>
                        <td><%= order.getId()%></td>
                        <td><%= order.getOrderDate()%></td>
                        <td><%= order.getTotalPrice()%></td>
                        <td>
                            <ul>
                                <%
                                    for (OrderItem item : order.getItems()) {
                                %>
                                <li>Product ID <%= item.getProductId()%>, Quantity: <%= item.getQuantity()%>, Price: <%= item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </td>
                        <td>
                            Payment Status: <%= order.getStatus()%>
                            <%
                                if ("pending".equalsIgnoreCase(order.getStatus())) {
                            %>
                            <!-- Pay Now Button -->
                            <form action="<%= request.getContextPath()%>/payPendingAmt" method="post" style="display:inline;">
                                <input type="hidden" name="orderId" value="<%= order.getId()%>" />
                                <input type="hidden" name="totalAmount" value="<%= order.getTotalPrice()%>" />
                                <button type="submit" class="pay-now-button">Pay Now</button>
                            </form>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </body>
</html>