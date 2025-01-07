/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.admin;

import com.mycompany.shopapp.dao.OrderDAO;
import com.mycompany.shopapp.model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author shabd
 */
@WebServlet(name = "OrderManagementServlet", urlPatterns = {"/admin/manage-orders"})
public class OrderManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> allOrders = orderDAO.getAllOrders();

        request.setAttribute("allOrders", allOrders);
        request.getRequestDispatcher("/Pages/Admin/OrderManagement/orderManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        if ("remove".equalsIgnoreCase(action)) {
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.deleteOrder(orderId);  // Implement this method in OrderDAO if not already done
        }

        response.sendRedirect("manage-orders");
    }
}