/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.user;

import com.mycompany.shopapp.dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shabd
 */
@WebServlet("/processPayment")
public class PaymentProcessingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve order details from the session
        Integer orderId = (Integer) session.getAttribute("pendingOrderId");
        Double totalAmount = (Double) session.getAttribute("pendingOrderAmount");

        if (orderId == null || totalAmount == null) {
            response.sendRedirect("cart.jsp?error=Invalid payment session");
            return;
        }

        // Simulate payment success
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        // Initialize the variable here
        boolean paymentSuccessful = false;

        if (cardNumber != null && cardNumber.length() == 16
                && expiry != null && !expiry.isEmpty()
                && cvv != null && cvv.length() == 3) {

            // Mark the order as paid in the database
            OrderDAO orderDAO = new OrderDAO();
            try {
                paymentSuccessful = orderDAO.markOrderAsPaid(orderId);
            } catch (Exception ex) {
                Logger.getLogger(PaymentProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (paymentSuccessful) {
            // Clear session attributes
            session.removeAttribute("pendingOrderId");
            session.removeAttribute("pendingOrderAmount");

            // Redirect to success page
            response.sendRedirect("Pages/User/order_success.jsp?orderId=" + orderId);
        } else {
            response.sendRedirect("Pages/User/payment_gateway.jsp?error=Failed to process payment");
        }
    }
}
