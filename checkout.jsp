<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.siyaa.model.Cart" %>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>

<style>

body{
font-family:Arial;
padding:30px;
}

.checkout-box{
width:400px;
border:1px solid #ddd;
padding:20px;
border-radius:10px;
}

input,textarea{
width:100%;
padding:8px;
margin:8px 0;
}

button{
background:#F26B8A;
color:white;
border:none;
padding:10px;
width:100%;
border-radius:20px;
}

</style>

</head>

<body>

<h2>Checkout</h2>

<%
List<Cart> cart = (List<Cart>) session.getAttribute("cart");
double total = 0;

if(cart != null){
for(Cart c : cart){
total += c.getPrice() * c.getQuantity();
}
}
%>

<div class="checkout-box">

<form action="PlaceOrderServlet" method="post">

Name
<input type="text" name="name" required>

Phone
<input type="text" name="phone" required>

Address
<textarea name="address" required></textarea>

City
<input type="text" name="city" required>

Pincode
<input type="text" name="pincode" required>

<h3>Total Amount: ₹<%=total%></h3>

<button type="submit">Place Order</button>

</form>

</div>

</body>
</html>