<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Details - Subhadip Medlife Pharmacy</title>
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
  }

  .container {
    max-width: 580px;
    margin: 0 auto;
  }

  /* Header */
  .hero-header {
    text-align: center;
    margin-bottom: 32px;
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

  /* Selected Doctor Summary Card */
  .doctor-summary-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 20px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
    display: flex;
    align-items: center;
    gap: 16px;
  }

  .summary-avatar {
    width: 52px;
    height: 52px;
    border-radius: 14px;
    background-color: var(--primary-soft);
    color: var(--primary);
    font-weight: 700;
    font-size: 1.1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }

  .summary-info h3 {
    font-size: 1.15rem;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 4px;
  }

  .summary-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: center;
    font-size: 0.85rem;
    color: var(--text-muted);
  }

  .specialty-tag {
    background-color: #f1f5f9;
    color: #475569;
    font-size: 0.78rem;
    font-weight: 600;
    padding: 2px 8px;
    border-radius: 6px;
  }

  /* Main Form Card */
  .form-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 32px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
  }

  .form-card h2 {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 20px;
    border-bottom: 1px solid var(--border-light);
    padding-bottom: 12px;
  }

  .form-group {
    margin-bottom: 18px;
  }

  .form-group label {
    display: block;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 6px;
  }

  .form-input, .form-select {
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

  .form-input:focus, .form-select:focus {
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
    margin-top: 8px;
    transition: background-color 0.15s ease, transform 0.1s ease;
  }

  .submit-btn:hover {
    background-color: var(--primary-hover);
  }

  .submit-btn:active {
    transform: scale(0.99);
  }

  /* Back Link */
  .back-container {
    text-align: center;
  }

  .back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: var(--text-muted);
    text-decoration: none;
    font-size: 0.92rem;
    font-weight: 600;
    padding: 8px 16px;
    border-radius: 8px;
    transition: color 0.15s ease, background-color 0.15s ease;
  }

  .back-link:hover {
    color: var(--primary);
    background-color: #f1f5f9;
  }
</style>
</head>
<body>

<div class="container">

  <!-- Header -->
  <header class="hero-header">
    <div class="brand-badge">Quick Appointment</div>
    <h1>Patient Details</h1>
    <p>Complete the form below to confirm your consultation</p>
  </header>

  <!-- Selected Doctor Card -->
  <div class="doctor-summary-card">
    <div class="summary-avatar">Dr</div>
    <div class="summary-info">
      <h3>${doctorNameSession}</h3>
      <div class="summary-meta">
        <span class="specialty-tag">${doctorSpecSession}</span>
        <span>&bull; Contact: <strong>${doctorPhoneSession}</strong></span>
      </div>
    </div>
  </div>

  <!-- Form Card -->
  <div class="form-card">
    <h2>Fill in your details</h2>

    <form action="PatientForm" method="post">
      <!-- Hidden Fields -->
      <input type="hidden" value="${doctorIdSession}" name="dId">
      <input type="hidden" value="${doctorNameSession}" name="dName">
      <input type="hidden" value="${doctorSpecSession}" name="dSpec">
      <input type="hidden" value="${doctorPhoneSession}" name="dPhone">

      <!-- Phone Number -->
      <div class="form-group">
        <label for="phone1">Phone Number</label>
        <input type="tel" id="phone1" maxlength="10" name="phone1" class="form-input" placeholder="Type your phone number" required>
      </div>

      <!-- Full Name -->
      <div class="form-group">
        <label for="name1">Patient Name</label>
        <input type="text" id="name1" name="name1" class="form-input" placeholder="Type your name" required>
      </div>

      <!-- Age -->
      <div class="form-group">
        <label for="age1">Age</label>
        <input type="number" id="age1" min="1" name="age1" class="form-input" placeholder="Type your age" required>
      </div>

      <!-- Gender -->
      <div class="form-group">
        <label for="gender1">Gender</label>
        <select id="gender1" name="gender1" class="form-select" required>
          <option value="" disabled selected>Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="submit-btn">Confirm &amp; Book Appointment</button>
    </form>
  </div>

  <!-- Back Link -->
  <div class="back-container">
    <a href="Home.jsp" class="back-link">&larr; Go back home</a>
  </div>

</div>

</body>
</html>