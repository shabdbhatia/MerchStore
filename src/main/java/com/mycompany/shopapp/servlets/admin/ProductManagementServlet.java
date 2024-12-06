package com.mycompany.shopapp.servlets.admin;

import com.mycompany.shopapp.dao.ProductDAO;
import com.mycompany.shopapp.model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "ProductManagementServlet", urlPatterns = {"/admin/productManagement"})
@MultipartConfig(maxFileSize = 16177215) // 16MB for image upload
public class ProductManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        ProductDAO productDAO = new ProductDAO();

        switch (action) {
            case "add":
                request.getRequestDispatcher("/Pages/Admin/ProductManagement/addProduct.jsp").forward(request, response);
                break;

            case "edit":
                int editProductId = Integer.parseInt(request.getParameter("id"));
                Product product = productDAO.getProductById(editProductId);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/Pages/Admin/ProductManagement/editProduct.jsp").forward(request, response);
                break;

            case "delete":
                int deleteProductId = Integer.parseInt(request.getParameter("id"));
                productDAO.deleteProduct(deleteProductId);
                response.sendRedirect("productManagement");
                break;

            case "list":
            default:
                List<Product> products = productDAO.getAllProducts();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/Pages/Admin/ProductManagement/productManagement.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();

        switch (action) {
            case "add":
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                Part imagePart = request.getPart("image");

                byte[] image = imagePart.getInputStream().readAllBytes();
                productDAO.addProduct(name, description, price, image);
                response.sendRedirect("productManagement");
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                String editName = request.getParameter("name");
                String editDescription = request.getParameter("description");
                double editPrice = Double.parseDouble(request.getParameter("price"));

                Part editImagePart = request.getPart("image");
                byte[] editImage = editImagePart.getInputStream().readAllBytes();
                productDAO.updateProduct(id, editName, editDescription, editPrice, editImage);
                response.sendRedirect("productManagement");
                break;

            default:
                response.sendRedirect("productManagement");
                break;
        }
    }
}
