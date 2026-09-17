<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subhadip's Login Portal</title>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            /* Modern deep tech abstract background */
            background: linear-gradient(rgba(10, 15, 30, 0.7), rgba(10, 15, 30, 0.7)),
                        url('https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat fixed;
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 38px 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4);
        }

        .card-header {
            text-align: center;
            margin-bottom: 28px;
        }

        .card-header h2 {
            font-size: 26px;
            color: #0f172a;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .card-header p {
            font-size: 14px;
            color: #64748b;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 18px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
        }

        .form-group input {
            width: 100%;
            padding: 11px 14px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            font-size: 14px;
            color: #1e293b;
            background-color: #ffffff;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-group input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.18);
        }

        .form-group input::placeholder {
            color: #94a3b8;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #4f46e5;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s ease, transform 0.1s ease;
            margin-top: 8px;
        }

        .submit-btn:hover {
            background-color: #4338ca;
        }

        .submit-btn:active {
            transform: scale(0.99);
        }

        .card-footer {
            margin-top: 24px;
            text-align: center;
            font-size: 14px;
            color: #64748b;
        }

        .card-footer a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: 600;
            margin-left: 4px;
            transition: color 0.2s ease;
        }

        .card-footer a:hover {
            color: #3730a3;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="card-header">
            <h2>Welcome Back</h2>
            <p>Enter your credentials to access your account</p>
        </div>

        <form action="Login" method="POST">
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email2" placeholder="subhadip@example.com" required autocomplete="email" />
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password"name="password2" placeholder="abc123****" required autocomplete="current-password" />
            </div>

            <button type="submit" class="submit-btn">Log In</button>
        </form>

        <div class="card-footer">
            <span>Don't have any account?</span>
            <a href="indexRegister.jsp">Create one</a>
        </div>
    </div>

</body>
</html>