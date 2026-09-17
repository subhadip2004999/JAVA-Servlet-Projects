<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subhadip's Registration Portal</title>
    
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
            /* Background image with a dark gradient overlay for contrast */
            background: linear-gradient(rgba(15, 23, 42, 0.75), rgba(15, 23, 42, 0.75)),
                        url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat fixed;
        }

        .registration-card {
            width: 100%;
            max-width: 480px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 36px 32px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 16px;
        }

        .form-group.full-width {
            grid-column: span 2;
            margin-bottom: 0;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            font-size: 14px;
            color: #1e293b;
            background-color: #fff;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.15);
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
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #4338ca;
        }

        .submit-btn:active {
            transform: scale(0.99);
        }

        @media (max-width: 480px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            .form-group.full-width {
                grid-column: span 1;
            }
            .registration-card {
                padding: 24px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="registration-card">
        <div class="card-header">
            <h2>Create an Account</h2>
            <p>Fill in the details below to complete your registration</p>
        </div>

        <form action="Register" method="Post">
            <div class="form-group">
                <label >Full Name</label>
                <input type="text"  name="name1" placeholder="Subhadip Biswas" required />
            </div>

            <div class="form-group">
                <label >Email Address</label>
                <input type="email" name="email1" placeholder="subhadip@example.com" required />
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label >Mobile</label>
                    <input type="tel" name="mobile1" placeholder="9876543210" required />
                </div>

                <div class="form-group">
                    <label >Gender</label>
                    <select  name="gender1" required>
                        <option value="" disabled selected>Select</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password1" placeholder="abc123****" required />
                </div>

                <div class="form-group">
                    <label >City</label>
                    <select  name="city1" required>
                        <option value="" disabled selected>Select</option>
                        <option value="Patna">Patna</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Lucknow">Lucknow</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Gauhati">Gauhati</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="submit-btn">Register Account</button>
        </form>
    </div>

</body>
</html>