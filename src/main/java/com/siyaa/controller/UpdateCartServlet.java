package com.siyaa.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.siyaa.model.Cart;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

String action = request.getParameter("action");
int id = Integer.parseInt(request.getParameter("id"));

HttpSession session = request.getSession();

List<Cart> cart = (List<Cart>) session.getAttribute("cart");

for(Cart c : cart){

if(c.getProductId() == id){

if(action.equals("plus")){
c.setQuantity(c.getQuantity()+1);
}

if(action.equals("minus") && c.getQuantity()>1){
c.setQuantity(c.getQuantity()-1);
}

}
}

response.sendRedirect("card.jsp");

}

}