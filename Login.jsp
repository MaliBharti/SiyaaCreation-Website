<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Login - Siyaa Creation</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Playfair+Display:wght@500&display=swap" rel="stylesheet">

<style>

body{
background:#fffaf7;
font-family:'Poppins',sans-serif;
height:100vh;
display:flex;
align-items:center;
justify-content:center;
}

/* Login Card */

.login-card{
width:380px;
background:white;
border-radius:20px;
padding:40px;
box-shadow:0 10px 30px rgba(0,0,0,0.1);
transition:0.4s;
}

.login-card:hover{
transform:translateY(-5px);
box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

/* Heading */

.login-title{
font-family:'Playfair Display',serif;
color:#DE5D83;
text-align:center;
margin-bottom:30px;
}

/* Inputs */

.form-control{
border-radius:25px;
padding:10px 15px;
border:1.5px solid #F26B8A;
transition:0.3s;
}

.form-control:focus{
box-shadow:0 0 8px rgba(242,107,138,0.5);
border-color:#ff80bf;
}

/* Button */

.login-btn{
width:100%;
border:none;
border-radius:25px;
padding:10px;
background:linear-gradient(45deg,#F26B8A,#ff8fb0);
color:white;
font-weight:500;
transition:0.3s;
}

.login-btn:hover{
transform:scale(1.05);
box-shadow:0 6px 15px rgba(242,107,138,0.5);
}

/* small text */

.register-link{
text-align:center;
margin-top:15px;
}

.register-link a{
color:#F26B8A;
text-decoration:none;
font-weight:500;
}

</style>

</head>

<body>

<div class="login-card">

<h2 class="login-title">Welcome Back</h2>

<form action="LoginServlet" method="post">

<div class="mb-3">
<input type="email" name="email" class="form-control" placeholder="Enter Email" required>
</div>

<div class="mb-3">
<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
</div>

<button type="submit" class="login-btn">Login</button>

</form>

<div class="register-link">
Don't have an account? <a href="form.jsp">Register</a>
</div>

</div>

</body>
</html>