<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Portal - Subhadip Medlife Pharmacy</title>
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
    --danger-bg: #fff1f2;
    --danger-border: #fecdd3;
    --danger-text: #e11d48;
    --danger-btn: #e11d48;
    --danger-btn-hover: #be123c;
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

  /* Header Section */
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

  /* Form Card */
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

  .btn-submit {
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

  .btn-submit:hover {
    background-color: var(--primary-hover);
  }

  .btn-submit:active {
    transform: scale(0.99);
  }

  /* Danger Zone Card */
  .danger-card {
    background-color: var(--card-bg);
    border: 2px solid var(--danger-border);
    border-radius: 16px;
    padding: 28px 32px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
  }

  .danger-header {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 12px;
  }

  .danger-badge {
    background-color: var(--danger-bg);
    color: var(--danger-text);
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    padding: 3px 8px;
    border-radius: 6px;
    border: 1px solid var(--danger-border);
  }

  .danger-card h3 {
    font-size: 1.15rem;
    font-weight: 700;
    color: var(--danger-text);
  }

  .danger-description {
    font-size: 0.88rem;
    color: var(--text-muted);
    margin-bottom: 18px;
  }

  .btn-danger {
    width: 100%;
    background-color: var(--danger-bg);
    color: var(--danger-text);
    border: 1.5px solid var(--danger-border);
    border-radius: 10px;
    padding: 12px 18px;
    font-size: 0.92rem;
    font-weight: 600;
    cursor: pointer;
    font-family: inherit;
    margin-bottom: 12px;
    transition: background-color 0.15s ease, color 0.15s ease, border-color 0.15s ease;
    text-align: center;
  }

  .btn-danger:hover {
    background-color: var(--danger-btn);
    color: #ffffff;
    border-color: var(--danger-btn);
  }

  .btn-danger:active {
    transform: scale(0.99);
  }

  /* Navigation Link */
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
    <div class="brand-badge">Administration Portal</div>
    <h1>Admin Workspace</h1>
    <p>Manage medical providers and database records</p>
  </header>

  <!-- Doctor Registration Card -->
  <div class="form-card">
    <h2>Add a New Doctor</h2>

    <form action="AdminServlet" method="post">
      <input type="hidden" name="action" value="addDoctor">

      <!-- Doctor ID -->
      <div class="form-group">
        <label for="dId">Doctor ID</label>
        <input type="text" id="dId" name="dId" class="form-input" placeholder="e.g., DOC101" required>
      </div>

      <!-- Doctor Name -->
      <div class="form-group">
        <label for="dName">Doctor Name</label>
        <input type="text" id="dName" name="dName" class="form-input" placeholder="Dr. Full Name" required>
      </div>

      <!-- Specialization -->
      <div class="form-group">
        <label for="dSpecialization">Specialization</label>
        <input type="text" id="dSpecialization" name="dSpecialization" class="form-input" placeholder="e.g., Cardiology, General Medicine" required>
      </div>

      <!-- Phone Number -->
      <div class="form-group">
        <label for="dPhone">Phone Number</label>
        <input type="tel" id="dPhone" maxlength="10" name="dPhone" class="form-input" placeholder="10-digit phone number" required>
      </div>

      <!-- Password -->
      <div class="form-group">
        <label for="dPassword">Password</label>
        <input type="password" id="dPassword" name="dPassword" class="form-input" placeholder="Set doctor login password" required>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="btn-submit">Register Doctor</button>
    </form>
  </div>

  <!-- Database Maintenance / Danger Zone Card -->
  <div class="danger-card">
    <div class="danger-header">
      <span class="danger-badge">Caution</span>
      <h3>Database Reset Actions</h3>
    </div>
    <p class="danger-description">These actions permanently wipe records. Use only during maintenance or testing.</p>

    <!-- Delete Appointments Form -->
    <form action="AdminServlet" method="post" onsubmit="return confirm('Are you sure you want to delete ALL rows from appointment_table?');">
      <input type="hidden" name="action" value="deleteAppointments">
      <button type="submit" class="btn-danger">Delete all rows in appointment_table</button>
    </form>

    <!-- Delete Patients Form -->
    <form action="AdminServlet" method="post" onsubmit="return confirm('Are you sure you want to delete ALL rows from patient_table?');">
      <input type="hidden" name="action" value="deletePatients">
      <button type="submit" class="btn-danger">Delete all rows in patient_table</button>
    </form>
  </div>

  <!-- Back Link -->
  <div class="back-container">
    <a href="Home.jsp" class="back-link">&larr; Return to Home</a>
  </div>

</div>

</body>
</html>