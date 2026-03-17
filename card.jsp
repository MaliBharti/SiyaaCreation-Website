<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.siyaa.model.Cart" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - Siyaa Creation</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">

<style>

body{
background:#fffaf7;
font-family:'Poppins',sans-serif;
}

/* Title */

.cart-title{
font-family:'Playfair Display',serif;
color:#DE5D83;
text-align:center;
margin-top:40px;
margin-bottom:40px;
}

/* Cart table */

.cart-table{
background:white;
border-radius:15px;
box-shadow:0 8px 25px rgba(0,0,0,0.1);
overflow:hidden;
}

/* Product image */

.product-img{
width:80px;
border-radius:10px;
transition:0.3s;
}

.product-img:hover{
transform:scale(1.1);
}

/* Remove button */

.remove-btn{
color:white;
background:#F26B8A;
border:none;
padding:6px 14px;
border-radius:20px;
text-decoration:none;
transition:0.3s;
}

.remove-btn:hover{
background:#DE5D83;
transform:scale(1.05);
}

/* Total section */

.total-box{
margin-top:30px;
text-align:right;
}

.checkout-btn{
background:linear-gradient(45deg,#F26B8A,#ff8fb0);
border:none;
padding:10px 25px;
border-radius:25px;
color:white;
font-weight:500;
transition:0.3s;
text-decoration:none;
}

.checkout-btn:hover{
transform:scale(1.05);
box-shadow:0 6px 15px rgba(242,107,138,0.5);
}

</style>

</head>

<body>

<div class="container">

<h2 class="cart-title">Your Shopping Cart</h2>

<%
List<Cart> cart = (List<Cart>) session.getAttribute("cart");
double total = 0;

if(cart != null && !cart.isEmpty()){
%>

<table class="table cart-table">

<thead class="table-light">
<tr>
<th>Image</th>
<th>Product</th>
<th>Price</th>
<th>Quantity</th>
<th>Subtotal</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
for(Cart c : cart){

double subtotal = c.getPrice() * c.getQuantity();
total += subtotal;
%>

<tr>

<td>
<img src="images/products/<%=c.getImage()%>" class="product-img">
</td>

<td>
<b><%=c.getName()%></b>
</td>

<td>
₹ <%=c.getPrice()%>
</td>

<td>

<a href="updateCart?action=minus&id=<%=c.getProductId()%>" 
style="padding:4px 10px;border:1px solid #F26B8A;border-radius:5px;text-decoration:none;">-</a>

<span style="margin:0 10px;"><%=c.getQuantity()%></span>

<a href="updateCart?action=plus&id=<%=c.getProductId()%>" 
style="padding:4px 10px;border:1px solid #F26B8A;border-radius:5px;text-decoration:none;">+</a>

</td>

<td>
₹ <%=subtotal%>
</td>

<td>
<a href="removeCart?id=<%=c.getProductId()%>" 
class="remove-btn"
onclick="return confirm('Remove this item from cart?')">
Remove
</a>
</td>

</tr>

<%
}
%>

</tbody>

</table>

<div class="total-box">

<h4>Total Amount: ₹ <%=total%></h4>

<br>

<a class="checkout-btn" href="checkout.jsp">Proceed to Checkout</a>


</div>

<%
}else{
%>

<div class="text-center">

<div style="text-align:center;margin-top:60px;">

<img src="images/empty-image.jfif" width="220">

<h4 style="color:#DE5D83;margin-top:20px;">Your Cart is Empty</h4>

<a href="products" 
style="
background:#F26B8A;
color:white;
padding:10px 20px;
border-radius:20px;
text-decoration:none;">
Start Shopping
</a>

</div>

</div>

<%
}
%>

</div>

</body>
</html>