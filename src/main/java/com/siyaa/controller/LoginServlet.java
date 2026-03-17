package com.siyaa.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.siyaa.dao.CustomerDao;
import com.siyaa.model.Customer;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerDao dao = new CustomerDao();
        Customer customer = dao.getCustomerByEmail(email);

        if (customer != null && BCrypt.checkpw(password, customer.getPassword())) {

            HttpSession session = request.getSession();
            session.setAttribute("user", customer);

            response.sendRedirect("home.jsp");

        } else {

            response.sendRedirect("login.jsp?error=Invalid credentials");

        }
    }
}