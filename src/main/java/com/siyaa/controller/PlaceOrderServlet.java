package com.siyaa.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.siyaa.util.DBConnection;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String name=request.getParameter("name");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String city=request.getParameter("city");
String pincode=request.getParameter("pincode");

HttpSession session=request.getSession();

double total=0;

java.util.List<com.siyaa.model.Cart> cart=
(java.util.List<com.siyaa.model.Cart>) session.getAttribute("cart");

if(cart!=null){

for(com.siyaa.model.Cart c:cart){
total+=c.getPrice()*c.getQuantity();
}

}

try{

Connection con=DBConnection.getConnection();

String sql="insert into orders(name,phone,address,city,pincode,total) values(?,?,?,?,?,?)";

PreparedStatement ps=con.prepareStatement(sql);

ps.setString(1,name);
ps.setString(2,phone);
ps.setString(3,address);
ps.setString(4,city);
ps.setString(5,pincode);
ps.setDouble(6,total);

ps.executeUpdate();

session.removeAttribute("cart");

response.sendRedirect("orderSuccess.jsp");

}catch(Exception e){
e.printStackTrace();
}

}

}