<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Dashboard by Subhadip</title>
    
    <!-- Bootstrap CSS for modern, responsive design -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Custom Hero Styling */
        .hero-section {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
            padding: 100px 0 120px;
            border-bottom-left-radius: 40px;
            border-bottom-right-radius: 40px;
        }
        
        /* Pulling the card up to overlap the hero section */
        .profile-card {
            margin-top: -60px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            border-radius: 20px;
        }
        
        .table th {
            width: 40%;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Hero Banner Section -->
    <header class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-3">Welcome back, ${name}!</h1>
            <p class="lead opacity-75">We are glad to have you here. View your profile details below.</p>
        </div>
    </header>

    <!-- User Details Card -->
    <main class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card profile-card border-0 bg-white p-4">
                    <div class="card-body">
                        <h4 class="card-title text-center mb-4" style="color: #4f46e5;">Profile Overview</h4>
                        
                        <table class="table table-borderless table-hover">
                            <tbody>
                                <tr>
                                    <th scope="row" class="text-muted">Full Name</th>
                                    <td class="fw-semibold text-end">${sName}</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-muted">Email Address</th>
                                    <td class="fw-semibold text-end">${sEmail}</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-muted">Mobile Number</th>
                                    <td class="fw-semibold text-end">${sMobile}</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-muted">Gender</th>
                                    <td class="fw-semibold text-end">${sGender}</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-muted">City</th>
                                    <td class="fw-semibold text-end">${sCity}</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <!-- Action Buttons -->
                        <div class="d-flex justify-content-center align-items-center flex-wrap gap-3 mt-4 pt-4 border-top">
                            <!-- Logout Button -->
                            <a href="index.html" class="btn btn-outline-secondary px-4 rounded-pill">Log Out</a>
                            
                            <!-- Delete Account Form -->
                            <form action="Delete" method="POST" class="m-0" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
                                <!-- Hidden field to pass the user's email/ID to the Delete Servlet -->
                                <input type="hidden" name="deleteEmail" value="${sEmail}">
                                
                                <button type="submit" class="btn btn-danger px-4 rounded-pill">
                                    Delete Account
                                </button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>