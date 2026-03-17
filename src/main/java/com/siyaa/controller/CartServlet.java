package com.siyaa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.siyaa.model.Cart;

@WebServlet("/addToCart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        HttpSession session = request.getSession();

        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");

        if(cartList == null){
            cartList = new ArrayList<>();
        }

        boolean exist = false;

        for(Cart c : cartList){

            if(c.getProductId() == id){

                c.setQuantity(c.getQuantity() + 1);
                exist = true;
                break;
            }
        }

        if(!exist){

            Cart cart = new Cart(id, name, price, 1, image);
            cartList.add(cart);
        }

        session.setAttribute("cart", cartList);

        response.sendRedirect("products");
    }
}