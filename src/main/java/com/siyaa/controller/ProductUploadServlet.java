package com.siyaa.controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.siyaa.dao.ProductDao;
import com.siyaa.model.Product;

@WebServlet("/UploadProductServlet")
@MultipartConfig
public class ProductUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {

        String name=request.getParameter("name");
        double price=Double.parseDouble(request.getParameter("price"));
        String category=request.getParameter("category");
        String description=request.getParameter("description");

        Part filePart=request.getPart("image");
        String fileName=filePart.getSubmittedFileName();

        String uploadPath=getServletContext().getRealPath("")+"images/products";

        File uploadDir=new File(uploadPath);
        if(!uploadDir.exists()){
            uploadDir.mkdir();
        }

        filePart.write(uploadPath+File.separator+fileName);

        Product product=new Product(name,price,category,description,fileName);

        ProductDao dao=new ProductDao();

        boolean status=dao.addProduct(product);

        if(status){
            response.sendRedirect("admin-success.jsp");
        }else{
            response.sendRedirect("error.jsp");
        }
    }
}