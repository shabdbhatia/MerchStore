/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mycompany.shopapp.dao.UserDAO;
import com.mycompany.shopapp.model.User;

import java.io.IOException;

@WebServlet("/signup") // Updated servlet mapping to /signup
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "U"; // Default role for new users

        // Initialize UserDAO
        UserDAO userDAO = new UserDAO();

        // Check if the username is already taken
        User existingUser = userDAO.getUserByUsername(username);
        if (existingUser != null) {
            // Redirect back to signup page with error message
            response.sendRedirect("Pages/Login/signup.jsp?error=username_exists");
            return;
        }

        // Add the new user to the database
        try {
            userDAO.addUser(username, password, role);
            response.sendRedirect("Pages/Login/signup.jsp?signup=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Pages/Login/signup.jsp?error=failed");
        }
    }
}
