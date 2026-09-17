<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write Prescription - Subhadip Medlife Pharmacy</title>
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
    max-width: 680px;
    margin: 0 auto;
  }

  /* Header */
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

  /* Patient Summary Card */
  .patient-summary-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 20px 24px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
    gap: 16px;
  }

  .summary-item {
    display: flex;
    flex-direction: column;
  }

  .summary-label {
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: 600;
    color: var(--text-muted);
    margin-bottom: 2px;
  }

  .summary-value {
    font-size: 0.98rem;
    font-weight: 600;
    color: var(--text-main);
  }

  .appt-badge {
    display: inline-block;
    background-color: var(--primary-soft);
    color: var(--primary);
    padding: 2px 8px;
    border-radius: 6px;
    font-size: 0.85rem;
    font-weight: 700;
    width: fit-content;
  }

  /* Prescription Form Card */
  .form-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 32px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
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

  .form-input, .form-textarea {
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

  .form-textarea {
    resize: vertical;
    min-height: 110px;
    line-height: 1.5;
  }

  .form-input:focus, .form-textarea:focus {
    outline: none;
    background-color: #ffffff;
    border-color: var(--primary);
    box-shadow: 0 0 0 4px rgba(2, 132, 199, 0.12);
  }

  .form-input::placeholder, .form-textarea::placeholder {
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

  /* Back Navigation */
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
    <div class="brand-badge">Clinical Prescription</div>
    <h1>Write Medical Prescription</h1>
    <p>Document findings and issue clinical treatment advice</p>
  </header>

  <!-- Patient Summary Card -->
  <div class="patient-summary-card">
    <div class="summary-item">
      <span class="summary-label">Appt ID</span>
      <span class="appt-badge">#<%= request.getAttribute("appointmentId") %></span>
    </div>
    <div class="summary-item">
      <span class="summary-label">Patient Name</span>
      <span class="summary-value"><%= request.getAttribute("patientName") %></span>
    </div>
    <div class="summary-item">
      <span class="summary-label">Age</span>
      <span class="summary-value"><%= request.getAttribute("patientAge") %> yrs</span>
    </div>
    <div class="summary-item">
      <span class="summary-label">Gender</span>
      <span class="summary-value"><%= request.getAttribute("patientGender") %></span>
    </div>
  </div>

  <!-- Prescription Form Card -->
  <div class="form-card">
    <h2>Prescription Details</h2>

    <form action="PrintPrescriptionServlet" method="POST">
      <!-- Hidden Inputs for Request Transfer -->
      <input type="hidden" name="appointmentId" value="<%= request.getAttribute("appointmentId") %>">
      <input type="hidden" name="patientName" value="<%= request.getAttribute("patientName") %>">
      <input type="hidden" name="patientAge" value="<%= request.getAttribute("patientAge") %>">
      <input type="hidden" name="patientGender" value="<%= request.getAttribute("patientGender") %>">

      <!-- Diagnosis -->
      <div class="form-group">
        <label for="diagnosis">Diagnosis / Clinical Findings</label>
        <input type="text" id="diagnosis" name="diagnosis" class="form-input" placeholder="e.g., Viral Pharyngitis" required>
      </div>

      <!-- Prescribed Medicines -->
      <div class="form-group">
        <label for="medicines">Prescribed Medicines &amp; Dosages</label>
        <textarea id="medicines" name="medicines" class="form-textarea" placeholder="e.g., 1. Tab Paracetamol 500mg (1-0-1) after food for 3 days&#10;2. Tab Cetirizine 10mg (0-0-1) at night" required></textarea>
      </div>

      <!-- Advice / Instructions -->
      <div class="form-group">
        <label for="advice">Advice / Instructions</label>
        <textarea id="advice" name="advice" class="form-textarea" placeholder="e.g., Warm saline gargle twice daily, maintain hydration."></textarea>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="submit-btn">Generate &amp; Print Prescription</button>
    </form>
  </div>

  <!-- Back Link -->
  <div class="back-container">
    <a href="DoctorDashboardServlet" class="back-link">&larr; Back to Dashboard</a>
  </div>

</div>

</body>
</html>