<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment Receipt - Subhadip Medlife Pharmacy</title>
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
    --accent-amber: #fffbeb;
    --accent-amber-text: #b45309;
    --accent-amber-border: #fde68a;
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
    max-width: 620px;
    margin: 0 auto;
  }

  /* Header Section */
  .receipt-header {
    text-align: center;
    margin-bottom: 24px;
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

  .receipt-header h1 {
    font-size: 1.85rem;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.02em;
  }

  /* Warning / Notice Banner */
  .notice-box {
    background-color: var(--accent-amber);
    border: 1px solid var(--accent-amber-border);
    border-radius: 12px;
    padding: 14px 18px;
    margin-bottom: 24px;
    display: flex;
    align-items: flex-start;
    gap: 12px;
  }

  .notice-icon {
    color: var(--accent-amber-text);
    font-weight: 700;
    font-size: 1.1rem;
    line-height: 1;
    margin-top: 2px;
  }

  .notice-text {
    font-size: 0.88rem;
    color: var(--accent-amber-text);
    font-weight: 500;
  }

  /* Receipt Card */
  .receipt-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 32px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 24px;
  }

  .receipt-section {
    margin-bottom: 24px;
  }

  .receipt-section:last-of-type {
    margin-bottom: 0;
    border-top: 1px dashed var(--border-card);
    padding-top: 24px;
  }

  .section-title {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 14px;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .data-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px 20px;
  }

  .data-item {
    display: flex;
    flex-direction: column;
  }

  .data-item.full-width {
    grid-column: 1 / -1;
  }

  .data-label {
    font-size: 0.78rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: 600;
    color: var(--text-muted);
    margin-bottom: 2px;
  }

  .data-value {
    font-size: 0.98rem;
    font-weight: 600;
    color: var(--text-main);
  }

  /* Button Actions */
  .actions-container {
    display: flex;
    gap: 12px;
    align-items: center;
    justify-content: center;
  }

  .print-btn {
    flex: 1;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    background-color: var(--primary);
    color: #ffffff;
    border: none;
    border-radius: 10px;
    padding: 13px 20px;
    font-size: 0.98rem;
    font-weight: 600;
    cursor: pointer;
    font-family: inherit;
    transition: background-color 0.15s ease, transform 0.1s ease;
  }

  .print-btn:hover {
    background-color: var(--primary-hover);
  }

  .print-btn:active {
    transform: scale(0.99);
  }

  .home-btn {
    text-decoration: none;
    color: var(--text-muted);
    background-color: #f1f5f9;
    padding: 13px 20px;
    border-radius: 10px;
    font-size: 0.95rem;
    font-weight: 600;
    transition: background-color 0.15s ease, color 0.15s ease;
  }

  .home-btn:hover {
    background-color: #e2e8f0;
    color: var(--text-main);
  }

  /* Print Styles */
  @media print {
    body {
      background-color: #ffffff;
      padding: 0;
    }
    .container {
      max-width: 100%;
    }
    .receipt-card {
      border: 1px solid #94a3b8;
      box-shadow: none;
      padding: 24px;
    }
    .no-print {
      display: none !important;
    }
    .notice-box {
      border: 1px solid #cbd5e1;
      background-color: #f8fafc;
      color: #334155;
    }
    .notice-icon, .notice-text {
      color: #334155;
    }
  }

  @media (max-width: 500px) {
    .data-grid {
      grid-template-columns: 1fr;
    }
    .actions-container {
      flex-direction: column;
    }
    .print-btn, .home-btn {
      width: 100%;
      text-align: center;
    }
  }
</style>
</head>
<body>

<div class="container">

  <!-- Header -->
  <header class="receipt-header">
    <div class="brand-badge">Subhadip Medlife Pharmacy</div>
    <h1>Appointment Receipt</h1>
  </header>

  <!-- Physical Verification Notice -->
  <div class="notice-box">
    <span class="notice-icon">&#9888;</span>
    <p class="notice-text">
      Please print or save a screenshot of this receipt and present it for physical verification on your appointment date.
    </p>
  </div>

  <!-- Receipt Card Content -->
  <div class="receipt-card" id="printableReceipt">

    <!-- Doctor Details -->
    <div class="receipt-section">
      <h2 class="section-title">Doctor Details</h2>
      <div class="data-grid">
        <div class="data-item full-width">
          <span class="data-label">Doctor Name</span>
          <span class="data-value">${doctorSessionName}</span>
        </div>
        <div class="data-item">
          <span class="data-label">Specialization</span>
          <span class="data-value">${doctorSessionSpec}</span>
        </div>
        <div class="data-item">
          <span class="data-label">Contact Number</span>
          <span class="data-value">${doctorSessionPhone}</span>
        </div>
      </div>
    </div>

    <!-- Patient Details -->
    <div class="receipt-section">
      <h2 class="section-title">Patient Details</h2>
      <div class="data-grid">
        <div class="data-item full-width">
          <span class="data-label">Patient Name</span>
          <span class="data-value">${patientNameSession}</span>
        </div>
        <div class="data-item">
          <span class="data-label">Age</span>
          <span class="data-value">${patientAgeSession} yrs</span>
        </div>
        <div class="data-item">
          <span class="data-label">Gender</span>
          <span class="data-value">${patientGenderSession}</span>
        </div>
        <div class="data-item full-width">
          <span class="data-label">Phone Number</span>
          <span class="data-value">${patientPhoneSession}</span>
        </div>
      </div>
    </div>

  </div>

  <!-- Action Buttons (Hidden during printing) -->
  <div class="actions-container no-print">
    <button type="button" class="print-btn" onclick="window.print()">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="6 9 6 2 18 2 18 9"></polyline>
        <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
        <rect x="6" y="14" width="12" height="8"></rect>
      </svg>
      Print Receipt
    </button>
    <a href="Home.jsp" class="home-btn">&larr; Back to Home</a>
  </div>

</div>

</body>
</html>