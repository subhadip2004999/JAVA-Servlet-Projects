<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Login - Subhadip Medlife Pharmacy</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --bg-surface: #f8fafc;
    --card-bg: #ffffff;
    --primary: #0284c7;
    --primary-hover: #0369a1;
    --primary-soft: #e0f2fe;
    --accent-mint: #ecfdf5;
    --accent-mint-text: #059669;
    --text-main: #1e293b;
    --text-muted: #64748b;
    --border-card: #cbd5e1;
    --border-light: #e2e8f0;
    --shadow-soft: 0 10px 25px -5px rgba(0, 0, 0, 0.04), 0 8px 10px -6px rgba(0, 0, 0, 0.02);
  }

  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Plus Jakarta Sans', sans-serif;
    background-color: var(--bg-surface);
    color: var(--text-main);
    line-height: 1.6;
    padding: 40px 20px;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .container {
    width: 100%;
    max-width: 480px;
    margin: 0 auto;
  }

  /* Header Section */
  .hero-header {
    text-align: center;
    margin-bottom: 28px;
  }

  .brand-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background-color: var(--accent-mint);
    color: var(--accent-mint-text);
    font-size: 0.85rem;
    font-weight: 600;
    padding: 6px 14px;
    border-radius: 9999px;
    margin-bottom: 12px;
  }

  .brand-badge::before {
    content: "";
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background-color: var(--accent-mint-text);
  }

  .hero-header h1 {
    font-size: 1.85rem;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.02em;
    margin-bottom: 6px;
  }

  .hero-header p {
    color: var(--text-muted);
    font-size: 0.95rem;
  }

  /* Main Form Card */
  .form-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 32px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 20px;
  }

  .form-card h2 {
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 20px;
    border-bottom: 1px solid var(--border-light);
    padding-bottom: 12px;
  }

  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    display: block;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 6px;
  }

  .form-input {
    width: 100%;
    padding: 12px 14px;
    border: 1.5px solid var(--border-light);
    border-radius: 10px;
    font-size: 0.95rem;
    font-family: inherit;
    color: var(--text-main);
    background-color: #f8fafc;
    transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
  }

  .form-input:focus {
    outline: none;
    background-color: #ffffff;
    border-color: var(--primary);
    box-shadow: 0 0 0 4px rgba(2, 132, 199, 0.12);
  }

  .form-input::placeholder {
    color: #94a3b8;
  }

  .submit-btn {
    width: 100%;
    background-color: var(--primary);
    color: #ffffff;
    border: none;
    border-radius: 10px;
    padding: 13px 20px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    font-family: inherit;
    margin-top: 6px;
    transition: background-color 0.15s ease, transform 0.1s ease;
  }

  .submit-btn:hover {
    background-color: var(--primary-hover);
  }

  .submit-btn:active {
    transform: scale(0.99);
  }

  /* Help & Navigation Footer */
  .help-card {
    text-align: center;
    background-color: #ffffff;
    border: 1px solid var(--border-light);
    border-radius: 12px;
    padding: 14px 18px;
    font-size: 0.88rem;
    color: var(--text-muted);
  }

  .help-card a {
    color: var(--primary);
    text-decoration: none;
    font-weight: 600;
    margin-left: 6px;
    transition: color 0.15s ease;
  }

  .help-card a:hover {
    color: var(--primary-hover);
    text-decoration: underline;
  }

  .divider {
    margin: 0 6px;
    color: #cbd5e1;
  }
</style>
</head>
<body>

<div class="container">

  <!-- Header -->
  <header class="hero-header">
    <div class="brand-badge">Provider Portal</div>
    <h1>Login as Doctor</h1>
    <p>Sign in to access your appointments and dashboard</p>
  </header>

  <!-- Login Card -->
  <div class="form-card">
    <h2>Doctor Authentication</h2>

    <form action="DoctorDashboardServlet" method="post">
      
      <!-- Doctor ID -->
      <div class="form-group">
        <label for="dId1">Doctor ID / Phone Number</label>
        <input type="text" id="dId1" name="dId1" class="form-input" placeholder="Type your phone number" required>
      </div>

      <!-- Password -->
      <div class="form-group">
        <label for="dPassword1">Password</label>
        <input type="password" id="dPassword1" name="dPassword1" class="form-input" placeholder="Type your password" required>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="submit-btn">Login to Dashboard</button>
    </form>
  </div>

  <!-- Help & Home Navigation -->
  <div class="help-card">
    <span>Forgot ID or password? Contact the admin.</span>
    <span class="divider">|</span>
    <a href="Home.jsp">&larr; Go Home</a>
  </div>

</div>

</body>
</html>