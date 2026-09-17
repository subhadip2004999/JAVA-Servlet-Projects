<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - E-blood Bank</title>
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
            margin-bottom: 30px;
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
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-col {
            flex: 1;
        }

        .form-label {
            display: block;
            color: #d4d4d4;
            font-size: 0.9rem;
            margin-bottom: 8px;
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

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23ffffff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #e53935;
            background-color: #121212;
            border: 1px solid #333333;
            cursor: pointer;
        }

        .checkbox-group label {
            color: #d4d4d4;
            font-size: 0.9rem;
            cursor: pointer;
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
                <i class="fas fa-tint"></i>
            </div>
            <h1>Create new account</h1>
            <p>Join E-blood bank portal as a donor</p>
        </div>

        <form action="RegistrationServlet" method="Post">
            <div class="form-group">
                <label class="form-label">Full name</label>
                <input type="text" name="name1" class="form-control" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label class="form-label" >Email address</label>
                <input type="email" name="email1" class="form-control" placeholder="you@example.com" required>
            </div>

            <div class="form-row">
                <div class="form-group form-col">
                    <label class="form-label" >Phone number</label>
                    <input type="tel"  name="phone1" class="form-control" placeholder="9876543210" required>
                </div>
                <div class="form-group form-col">
                    <label class="form-label" >Blood group</label>
                    <select  name="blood1" class="form-control" required>
                        <option value="" disabled selected>Select group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label" >City</label>
                <select  name="city1" class="form-control" required>
                        <option value="" disabled selected>Select City</option>
                        <option value="Asansol">Asansol</option>
                        <option value="Bardhaman">Bardhaman</option>
                        <option value="Darjeeling">Darjeeling</option>
                        <option value="Durgapur">Durgapur</option>
                        <option value="Haldia">Haldia</option>
                        <option value="Kharagpur">Kharagpur</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Malda">Malda</option>
                        <option value="Siliguri">Siliguri</option>
                    </select>
            </div>

            <div class="form-group">
                <label class="form-label" >Password</label>
                <input type="password" name="password1" class="form-control" placeholder="Create a password" required>
            </div>

            <div class="checkbox-group">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">I agree to the terms and privacy policy</label>
            </div>

            <button type="submit" class="btn-submit">Create account</button>
        </form>

        <div class="footer-link">
            Already have an account? <a href="DonorLogin.jsp">Login</a>
        </div>
    </div>

</body>
</html>