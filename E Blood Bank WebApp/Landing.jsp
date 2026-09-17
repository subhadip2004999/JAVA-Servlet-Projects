<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-blood Bank Portal by Subhadip</title>
    <!-- Using FontAwesome for the icons in the design -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* CSS Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #000000; /* Strict black background as requested */
            color: #ffffff;
            line-height: 1.6;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px;
        }

        section {
            padding: 60px 0;
            border-bottom: 1px solid #1a1a1a;
        }

        section:last-child {
            border-bottom: none;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding-top: 80px;
        }

        .badge {
            display: inline-block;
            background-color: #2a1111;
            color: #ff6b6b;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            margin-bottom: 24px;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: 600;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .hero p {
            color: #a3a3a3;
            max-width: 600px;
            margin: 0 auto 40px auto;
            font-size: 1.1rem;
        }

        /* Stats Section */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 40px;
        }

        .stat-card {
            background-color: #121212;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
        }

        .stat-card p {
            color: #a3a3a3;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }

        .stat-card h3 {
            font-size: 2rem;
            font-weight: 600;
        }

        /* Features Section */
        .features-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .features-header h2 {
            font-size: 2rem;
            margin-bottom: 15px;
        }

        .features-header p {
            color: #a3a3a3;
            max-width: 700px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .feature-card {
            background-color: transparent;
            border: 1px solid #262626;
            padding: 30px;
            border-radius: 8px;
        }

        .feature-icon {
            color: #e53935;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .feature-card p {
            color: #a3a3a3;
            font-size: 0.9rem;
        }

        /* Split Sections (Donor / Patient) */
        .split-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 60px;
        }

        .split-content {
            flex: 1;
        }

        .split-visual {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .circle-visual {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 4rem;
        }

        .circle-red {
            background-color: #2a1111;
            color: #e53935;
        }

        .circle-blue {
            background-color: #0d1b2a;
            color: #1b4965;
        }

        .split-content h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .split-content > p {
            color: #a3a3a3;
            margin-bottom: 30px;
        }

        .check-list {
            list-style: none;
            margin-bottom: 30px;
        }

        .check-list li {
            margin-bottom: 15px;
            color: #d4d4d4;
            display: flex;
            align-items: flex-start;
            font-size: 0.95rem;
        }

        .check-list li i {
            margin-right: 10px;
            margin-top: 4px;
            font-size: 0.9rem;
        }

        /* Buttons */
        .btn {
            display: inline-block; /* Added for anchor tags */
            text-decoration: none; /* Added for anchor tags */
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-red {
            background-color: #d93838;
            color: white;
        }

        .btn-blue {
            background-color: #102a43;
            color: #62b0ff;
            border: 1px solid #1f4068;
        }

        /* Footer & Contact Section */
        .contact-section {
            padding-bottom: 20px;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h2 {
            font-size: 2rem;
        }

        .contact-box {
            background-color: #121212;
            border-radius: 8px;
            padding: 40px;
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
        }

        .contact-left h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .contact-left p {
            color: #a3a3a3;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .social-icons {
            display: flex;
            gap: 15px;
        }

        .social-icons a {
            color: #a3a3a3;
            font-size: 1.2rem;
            text-decoration: none;
        }

        .contact-right {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            color: #d4d4d4;
            font-size: 0.9rem;
        }

        .contact-item i {
            width: 25px;
            color: #a3a3a3;
        }

        .footer-bottom {
            text-align: center;
            color: #666666;
            font-size: 0.8rem;
            padding-top: 20px;
            border-top: 1px solid #1a1a1a;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .stats-grid, .features-grid {
                grid-template-columns: 1fr;
            }
            .split-section {
                flex-direction: column;
                text-align: center;
            }
            .split-section:nth-of-type(even) {
                flex-direction: column-reverse;
            }
            .check-list li {
                justify-content: center;
                text-align: left;
            }
            .contact-box {
                flex-direction: column;
                gap: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- Hero Section -->
    <section class="hero container">
        <div class="badge">
            <i class="fas fa-heart"></i> Saving lives, one donation at a time
        </div>
        <h1>Every drop counts. Every donor<br>matters.</h1>
        <p>A platform connecting blood donors with patients, hospitals, and<br>blood banks in real time.</p>
        
        <!-- Stats Row -->
        <div class="stats-grid">
            <div class="stat-card">
                <p>Registered donors</p>
                <h3>Not Yet</h3>
            </div>
            <div class="stat-card">
                <p>Lives saved</p>
                <h3>Not Yet</h3>
            </div>
            <div class="stat-card">
                <p>Partner hospitals</p>
                <h3>Not Yet</h3>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="container">
        <div class="features-header">
            <h2>How the portal helps</h2>
            <p>We bridge the gap between willing donors and patients in urgent need, making blood donation simple, fast, and transparent for everyone involved.</p>
        </div>
        
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-tint"></i></div>
                <h3>Real-time matching</h3>
                <p>Get matched with nearby donors or requests within minutes.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-user-check"></i></div>
                <h3>Verified profiles</h3>
                <p>Every donor and blood bank is verified before being listed.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-headset"></i></div>
                <h3>24/7 support</h3>
                <p>Our support team is available around the clock for emergencies.</p>
            </div>
        </div>
    </section>

    <!-- Be a Donor Section -->
    <section class="container split-section">
        <div class="split-visual">
            <div class="circle-visual circle-red">
                <i class="fas fa-hand-holding-water"></i>
            </div>
        </div>
        <div class="split-content">
            <h2>Be a donor</h2>
            <p>Register once and get notified whenever someone nearby needs your blood type. Your donation can save up to three lives.</p>
            <ul class="check-list">
                <li><i class="far fa-check-square"></i> Free health checkup with every donation</li>
                <li><i class="far fa-check-square"></i> Donation reminders and eligibility tracking</li>
                <li><i class="far fa-check-square"></i> Digital donor certificate and badges</li>
            </ul>
            <!-- Link Redirects -->
            <a href="DonorRegistration.jsp" class="btn btn-red">Register as donor</a>
        </div>
    </section>

    <!-- Need Blood Section -->
    <section class="container split-section" style="flex-direction: row-reverse;">
        <div class="split-visual">
            <div class="circle-visual circle-blue">
                <i class="fas fa-search-plus"></i>
            </div>
        </div>
        <div class="split-content">
            <h2>Need blood</h2>
            <p>Submit a request with the required blood group and location, and we'll connect you with verified donors and nearby blood banks instantly.</p>
            <ul class="check-list">
                <li><i class="far fa-check-square"></i> Search by blood group and distance</li>
                <li><i class="far fa-check-square"></i> Direct contact with available donors</li>
                <li><i class="far fa-check-square"></i> Emergency request priority handling</li>
            </ul>
            <!-- Link Redirects -->
            <a href="PatientDetailsForm.jsp" class="btn btn-blue">Request blood now</a>
        </div>
    </section>

    <!-- Contact & Support Section -->
    <section class="container contact-section">
        <div class="contact-header">
            <h2>Contact and support</h2>
        </div>
        <div class="contact-box">
            <div class="contact-left">
                <h3>Developer: Subhadip Biswas (JAVA,SQL,JSP)</h3>
                <p>Connecting blood donors and patients instantly to save lives when it matters most.</p>
                <div class="social-icons">
                    <a href="https://www.facebook.com/subhadip.biswas.2004"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://www.github.com/subhadip2004999"><i class="fab fa-github"></i></a>
                    <a href="https://www.instagram.com/astro_subhadip"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/subhadip-biswas-7824a2283"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="contact-right">
                <div class="contact-item">
                    <i class="far fa-envelope"></i> businesssubhadip@gmail.com
                </div>
                <div class="contact-item">
                    <i class="fas fa-phone-alt"></i> +91 7980125161
                </div>
                <div class="contact-item">
                    <i class="fas fa-map-marker-alt"></i> Kolkata, West Bengal, India
                </div>
            </div>
        </div>
        
        <div class="footer-bottom">
            &copy; 2026 E-blood bank portal. All rights reserved.
        </div>
    </section>

</body>
</html>