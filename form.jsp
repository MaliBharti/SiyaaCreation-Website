<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jewellery Form</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f7c1cc, #fff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background: #ffffff;
            width: 380px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border-top: 6px solid #d4af37;
        }

        .form-container h2 {
            text-align: center;
            color: #d4af37;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #b76e79;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #f7c1cc;
            outline: none;
            font-size: 14px;
        }

        .form-group input:focus {
            border-color: #d4af37;
            box-shadow: 0 0 5px rgba(212, 175, 55, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #d4af37, #f7c1cc);
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 25px;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(90deg, #f7c1cc, #d4af37);
        }

        .footer-text {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: #999;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Customer Details</h2>

    <form action="InsertCustomerServlet" method="post">
        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit" class="btn">Submit</button>
    </form>

    <div class="footer-text">
        ✨ Elegance in Every Jewel ✨
    </div>
</div>

</body>
</html>
