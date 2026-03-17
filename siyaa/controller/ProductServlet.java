package com.siyaa.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.siyaa.dao.ProductDao;
import com.siyaa.model.Product;

@WebServlet("/products")
public class ProductServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();

        List<Product> productList = dao.getAllProducts();

        request.setAttribute("products", productList);

        request.getRequestDispatcher("products.jsp").forward(request,response);
    }
}