/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author shabd
 */
@WebServlet(name = "PayPendingServlet", urlPatterns = {"/payPendingAmt"})
public class PayPendingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve order details from the request
        String orderIdParam = request.getParameter("orderId");
        String totalAmountParam = request.getParameter("totalAmount");

        if (orderIdParam != null && totalAmountParam != null) {
            Integer orderId = Integer.valueOf(orderIdParam);
            
            Double totalAmount = Double.valueOf(totalAmountParam);

            // Set order details as session attributes
            session.setAttribute("pendingOrderId", orderId);
            session.setAttribute("pendingOrderAmount", totalAmount);
            request.setAttribute("amount", totalAmount);

            // Redirect to the OrderServlet or next step
            request.getRequestDispatcher("Pages/User/payment_gateway.jsp").forward(request, response);
        } else {
            response.sendRedirect("Pages/User/order_history.jsp?error=Invalid order details");
        }
    }

}
