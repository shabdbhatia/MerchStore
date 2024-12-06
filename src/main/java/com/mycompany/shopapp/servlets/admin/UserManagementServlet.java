/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shopapp.servlets.admin;

import com.mycompany.shopapp.dao.UserDAO;
import com.mycompany.shopapp.model.User;
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
@WebServlet(name = "UserManagementServlet", urlPatterns = {"/admin/userManagement"})
public class UserManagementServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserManagementServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                request.getRequestDispatcher("/Pages/Admin/UserManagement/addUser.jsp").forward(request, response);
                break;

            case "edit":
                int editUserId = Integer.parseInt(request.getParameter("id"));
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserById(editUserId);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/Pages/Admin/UserManagement/editUser.jsp").forward(request, response);
                break;

            case "delete":
                int deleteUserId = Integer.parseInt(request.getParameter("id"));
                UserDAO deleteUserDAO = new UserDAO();
                deleteUserDAO.deleteUser(deleteUserId);
                response.sendRedirect("userManagement");
                break;

            case "list":
            default:
                UserDAO listUserDAO = new UserDAO();
                List<User> users = listUserDAO.getAllUsers(); // Ensure this method is implemented
                request.setAttribute("users", users);
                request.getRequestDispatcher("/Pages/Admin/UserManagement/userManagement.jsp").forward(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                String addUsername = request.getParameter("username");
                String addPassword = request.getParameter("password");
                String addRole = request.getParameter("role");
                UserDAO addUserDAO = new UserDAO();
                addUserDAO.addUser(addUsername, addPassword, addRole);
                response.sendRedirect("userManagement");
                break;

            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                String editUsername = request.getParameter("username");
                String editPassword = request.getParameter("password");
                String editRole = request.getParameter("role");
                UserDAO editUserDAO = new UserDAO();
                editUserDAO.updateUser(editId, editUsername, editPassword, editRole);
                response.sendRedirect("userManagement");
                break;

            default:
                response.sendRedirect("userManagement");
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}