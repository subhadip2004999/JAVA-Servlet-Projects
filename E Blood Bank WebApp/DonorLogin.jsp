<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-blood Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #000000;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .auth-card {
            background-color: #161616;
            width: 100%;
            max-width: 500px;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }

        .header-links {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .header-links a {
            color: #a3a3a3;
            text-decoration: none;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.2s;
        }

        .header-links a:hover {
            color: #ffffff;
        }

        .auth-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .icon-circle {
            width: 48px;
            height: 48px;
            background-color: #2a1111;
            color: #e53935;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            margin: 0 auto 15px auto;
        }

        .auth-header h1 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .auth-header p {
            color: #a3a3a3;
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: flex;
            justify-content: space-between;
            color: #d4d4d4;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }

        .forgot-pass {
            color: #d93838;
            text-decoration: none;
            font-size: 0.85rem;
        }

        .forgot-pass:hover {
            text-decoration: underline;
        }

        .form-control {
            width: 100%;
            background-color: #121212;
            border: 1px solid #333333;
            color: #ffffff;
            padding: 12px 15px;
            border-radius: 6px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.2s;
        }

        .form-control:focus {
            border-color: #e53935;
        }

        .form-control::placeholder {
            color: #666666;
        }

        .btn-submit {
            width: 100%;
            background-color: #d93838;
            color: #ffffff;
            border: none;
            padding: 14px;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-bottom: 20px;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #e53935;
        }

        .footer-link {
            text-align: center;
            font-size: 0.95rem;
            color: #a3a3a3;
        }

        .footer-link a {
            color: #d93838;
            text-decoration: none;
        }

        .footer-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="auth-card">
        <div class="header-links">
            <a href="Landing.jsp"><i class="fas fa-chevron-left"></i> Back to home</a>
          
        </div>

        <div class="auth-header">
            <div class="icon-circle">
                <i class="fas fa-user"></i>
            </div>
            <h1>Welcome back</h1>
            <p>Log in to your E-blood bank account</p>
        </div>

        <form action="LoginServlet" method="Post">
            <div class="form-group">
                <label class="form-label">Email address</label>
                <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
            </div>

            <div class="form-group">
                <div class="form-label">
                    <label>Password</label>
                    
                </div>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-submit">Login</button>
        </form>

        <div class="footer-link">
            Don't have an account? <a href="DonorRegistration.jsp">Create one</a>
        </div>
    </div>

</body>
</html>