/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.user;

import com.mycompany.shopapp.dao.ProductDAO;
import com.mycompany.shopapp.model.OrderItem;
import com.mycompany.shopapp.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shabd
 */
@WebServlet(name = "UserCartServlet", urlPatterns = {"/cart"})
public class UserCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("CartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("CartItems", cartItems);
        }

        // Forward to the cart.jsp page
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("/Pages/User/cart.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("CartItems");

    if (cartItems == null) {
        cartItems = new ArrayList<>();
    }

    String action = request.getParameter("action");
    int productId = Integer.parseInt(request.getParameter("productId"));

    if (action != null) {
        switch (action) {
            case "add":
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int qty = Integer.parseInt(request.getParameter("qty")); // Read the quantity from the request
                boolean exists = false;

                for (OrderItem item : cartItems) {
                    if (item.getProductId() == productId) {
                        item.setQuantity(item.getQuantity() + qty); // Increment quantity by selected value
                        exists = true;
                        break;
                    }
                }

                if (!exists) {
                    cartItems.add(new OrderItem(0, name,  productId, qty, price)); // Add new item with selected quantity
                }
                break;

            case "update":
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartItems.stream()
                        .filter(item -> item.getProductId() == productId)
                        .forEach(item -> item.setQuantity(quantity));
                break;

            case "remove":
                cartItems.removeIf(item -> item.getProductId() == productId);
                break;

            default:
                break;
        }
    }

    session.setAttribute("CartItems", cartItems);
    response.sendRedirect(request.getContextPath() + "/cart");
}
}
