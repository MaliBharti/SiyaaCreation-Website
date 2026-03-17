package com.siyaa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import com.siyaa.model.Cart;

@WebServlet("/removeCart")
public class RemoveCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();

        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");

        if(cartList != null){

            cartList.removeIf(c -> c.getProductId() == id);

        }

        response.sendRedirect("card.jsp");
    }
}