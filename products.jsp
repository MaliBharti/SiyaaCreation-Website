<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.siyaa.model.Product" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Our Products</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">

<style>

body{
background:#fffaf7;
font-family:'Poppins',sans-serif;
}

/* Page title */

.page-title{
font-family:'Playfair Display',serif;
color:#DE5D83;
text-align:center;
margin-top:40px;
margin-bottom:40px;
}

/* Product Card */

.product-card{
border:none;
border-radius:20px;
overflow:hidden;
background:white;
box-shadow:0 8px 25px rgba(0,0,0,0.08);
transition:all 0.4s ease;
}

.product-card:hover{
transform:translateY(-8px);
box-shadow:0 12px 30px rgba(0,0,0,0.15);
}

/* Product Image */

.product-img{
height:220px;
object-fit:cover;
transition:transform 0.5s ease;
}

.product-card:hover .product-img{
transform:scale(1.08);
}

/* Product Name */

.product-name{
font-weight:600;
font-size:18px;
color:#8b6c5c;
}

/* Price */

.product-price{
color:#F26B8A;
font-weight:600;
font-size:17px;
}

/* Category */

.product-category{
font-size:13px;
color:gray;
}

/* Description */

.product-desc{
font-size:14px;
color:#555;
height:40px;
overflow:hidden;
}

/* Add to Cart Button */

.cart-btn{
background:linear-gradient(45deg,#F26B8A,#ff8fb0);
border:none;
border-radius:30px;
padding:8px 18px;
color:white;
font-weight:500;
transition:all 0.3s ease;
}

.cart-btn:hover{
transform:scale(1.05);
box-shadow:0 6px 15px rgba(242,107,138,0.5);
}

</style>

</head>

<body>

<div class="container">

<h2 class="page-title">Our Jewellery Collection</h2>

<div class="row">

<%
List<Product> list = (List<Product>) request.getAttribute("products");

if(list != null){

for(Product p : list){
%>

<div class="col-md-4 mb-4">

<div class="card product-card">

<img src="images/products/<%=p.getImage()%>" class="card-img-top product-img">

<div class="card-body text-center">

<div class="product-name"><%=p.getName()%></div>

<div class="product-price">₹ <%=p.getPrice()%></div>

<div class="product-category"><%=p.getCategory()%></div>

<p class="product-desc"><%=p.getDescription()%></p>

<form action="addToCart" method="post">

<input type="hidden" name="id" value="<%=p.getId()%>">
<input type="hidden" name="name" value="<%=p.getName()%>">
<input type="hidden" name="price" value="<%=p.getPrice()%>">
<input type="hidden" name="image" value="<%=p.getImage()%>">

<button type="submit" class="cart-btn">Add to Cart</button>

</form>

</div>

</div>

</div>

<%
}

}else{
%>

<p class="text-center">No products available</p>

<%
}
%>

</div>

</div>

</body>
</html>