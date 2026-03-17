package com.siyaa.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.siyaa.dao.CustomerDao;
import com.siyaa.model.Customer;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/InsertCustomerServlet") 

public class InsertCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        Customer customer = new Customer(name, email, phone, hashedPassword);

        CustomerDao dao = new CustomerDao();
        boolean status = dao.registerCustomer(customer);

        if (status) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}