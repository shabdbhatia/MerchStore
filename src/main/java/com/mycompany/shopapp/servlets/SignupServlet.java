package com.mycompany.shopapp.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mycompany.shopapp.dao.UserDAO;
import com.mycompany.shopapp.model.User;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = "U"; // Default role for new users

        // Ensure passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("Pages/Login/signup.jsp?error=password_mismatch");
            return;
        }

        // Check password strength
        String passwordRegex = "^(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        if (!password.matches(passwordRegex)) {
            response.sendRedirect("Pages/Login/signup.jsp?error=weak_password");
            return;
        }

        UserDAO userDAO = new UserDAO();
        User existingUser = userDAO.getUserByUsername(username);

        if (existingUser != null) {
            response.sendRedirect("Pages/Login/signup.jsp?error=username_exists");
            return;
        }

        try {
            userDAO.addUser(username, password, role);
            response.sendRedirect("Pages/Login/signup.jsp?signup=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Pages/Login/signup.jsp?error=failed");
        }
    }
}
