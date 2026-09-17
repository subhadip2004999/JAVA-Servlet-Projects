<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prescription Print Preview - Subhadip Medlife Pharmacy</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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

  .wrapper {
    max-width: 820px;
    margin: 0 auto;
  }

  /* Prescription Document Sheet */
  .prescription-sheet {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 40px;
    box-shadow: var(--shadow-soft);
  }

  /* Header Section */
  .rx-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    border-bottom: 2px solid var(--primary-soft);
    padding-bottom: 20px;
    margin-bottom: 24px;
    gap: 20px;
  }

  .brand-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background-color: var(--accent-mint);
    color: var(--accent-mint-text);
    font-size: 0.8rem;
    font-weight: 600;
    padding: 4px 12px;
    border-radius: 9999px;
    margin-bottom: 10px;
  }

  .brand-badge::before {
    content: "";
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background-color: var(--accent-mint-text);
  }

  .doctor-profile h2 {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.01em;
    margin-bottom: 4px;
  }

  .doctor-meta {
    font-size: 0.9rem;
    color: var(--text-muted);
  }

  .doctor-meta strong {
    color: var(--text-main);
  }

  .clinic-meta {
    text-align: right;
    display: flex;
    flex-direction: column;
    gap: 6px;
    font-size: 0.88rem;
    color: var(--text-muted);
  }

  .meta-tag {
    display: inline-block;
    background-color: #f1f5f9;
    color: var(--text-main);
    padding: 4px 12px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 0.82rem;
    align-self: flex-end;
  }

  /* Patient Summary Strip */
  .patient-strip {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    background-color: #f8fafc;
    border: 1px solid var(--border-light);
    padding: 16px 20px;
    border-radius: 12px;
    margin-bottom: 28px;
  }

  .strip-item {
    display: flex;
    flex-direction: column;
  }

  .strip-label {
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: 600;
    color: var(--text-muted);
    margin-bottom: 2px;
  }

  .strip-value {
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--text-main);
  }

  /* Rx Symbol & Content Blocks */
  .rx-symbol {
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--primary);
    margin-bottom: 16px;
    display: inline-block;
    line-height: 1;
  }

  .section-label {
    font-size: 0.82rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-muted);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 6px;
  }

  .content-card {
    background-color: #fafbfc;
    border: 1px solid var(--border-light);
    border-radius: 10px;
    padding: 16px 18px;
    font-size: 0.95rem;
    line-height: 1.7;
    color: var(--text-main);
    white-space: pre-wrap;
    margin-bottom: 22px;
  }

  /* Footer & Signature */
  .prescription-footer {
    margin-top: 48px;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    border-top: 1px dashed var(--border-light);
    padding-top: 24px;
  }

  .footer-brand {
    font-size: 0.82rem;
    color: var(--text-muted);
    font-weight: 500;
  }

  .signature-area {
    text-align: center;
    width: 210px;
  }

  .signature-line {
    border-top: 1.5px solid var(--border-card);
    padding-top: 8px;
    font-size: 0.85rem;
    font-weight: 600;
    color: var(--text-main);
  }

  /* Action Buttons */
  .actions-toolbar {
    margin-top: 24px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 12px;
  }

  .btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 22px;
    border-radius: 10px;
    font-size: 0.95rem;
    font-weight: 600;
    font-family: inherit;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.15s ease, transform 0.1s ease;
    border: none;
  }

  .btn-print {
    background-color: var(--primary);
    color: #ffffff;
  }

  .btn-print:hover {
    background-color: var(--primary-hover);
  }

  .btn-back {
    background-color: #f1f5f9;
    color: var(--text-muted);
  }

  .btn-back:hover {
    background-color: #e2e8f0;
    color: var(--text-main);
  }

  .btn:active {
    transform: scale(0.99);
  }

  /* Print Layout Adjustments */
  @media print {
    body {
      background-color: #ffffff;
      padding: 0;
      color: #000000;
    }
    .wrapper {
      max-width: 100%;
    }
    .prescription-sheet {
      border: 1px solid #94a3b8;
      box-shadow: none;
      border-radius: 0;
      padding: 30px;
    }
    .content-card, .patient-strip {
      background-color: #ffffff !important;
      border: 1px solid #cbd5e1;
    }
    .actions-toolbar {
      display: none !important;
    }
    .meta-tag, .brand-badge {
      border: 1px solid #cbd5e1;
      background-color: #ffffff !important;
      color: #000000 !important;
    }
  }

  @media (max-width: 640px) {
    .rx-header {
      flex-direction: column;
    }
    .clinic-meta {
      text-align: left;
      align-items: flex-start;
    }
    .meta-tag {
      align-self: flex-start;
    }
    .patient-strip {
      grid-template-columns: 1fr 1fr;
    }
    .actions-toolbar {
      flex-direction: column-reverse;
    }
    .btn {
      width: 100%;
      justify-content: center;
    }
  }
</style>
</head>
<body>

<div class="wrapper">

  <!-- Printable Prescription Sheet -->
  <div class="prescription-sheet">

    <!-- Header / Doctor Info -->
    <div class="rx-header">
      <div class="doctor-profile">
        <div class="brand-badge">Subhadip Medlife Pharmacy</div>
        <h2><%= session.getAttribute("doctorSessionName") != null ? session.getAttribute("doctorSessionName") : "Doctor" %></h2>
        <div class="doctor-meta">
          <p><strong>Specialization:</strong> <%= session.getAttribute("doctorSessionSpec") != null ? session.getAttribute("doctorSessionSpec") : "General Medicine" %></p>
          <p><strong>Contact:</strong> <%= session.getAttribute("doctorSessionPhone") != null ? session.getAttribute("doctorSessionPhone") : "N/A" %></p>
        </div>
      </div>

      <div class="clinic-meta">
       
        <br/><span><strong>Date:</strong> <%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></span>
      </div>
    </div>

    <!-- Patient Details Strip -->
    <div class="patient-strip">
      <div class="strip-item">
        <span class="strip-label">Patient Name</span>
        <span class="strip-value"><%= request.getAttribute("patientName") %></span>
      </div>
      <div class="strip-item">
        <span class="strip-label">Age</span>
        <span class="strip-value"><%= request.getAttribute("patientAge") %> yrs</span>
      </div>
      <div class="strip-item">
        <span class="strip-label">Gender</span>
        <span class="strip-value"><%= request.getAttribute("patientGender") %></span>
      </div>
      <div class="strip-item">
        <span class="strip-label">Appt ID</span>
        <span class="strip-value">#<%= request.getAttribute("appointmentId") %></span>
      </div>
    </div><br/>

    <!-- Rx Symbol -->
   

    <!-- Diagnosis -->
    <div class="section-label">Diagnosis / Clinical Findings</div>
    <div class="content-card"><%= request.getAttribute("diagnosis") %></div>

    <!-- Prescribed Medicines -->
    <div class="section-label">Prescribed Medication &amp; Dosages</div>
    <div class="content-card"><%= request.getAttribute("medicines") %></div>

    <!-- Advice / Instructions -->
    <div class="section-label">Instructions &amp; Advice</div>
    <div class="content-card"><%= request.getAttribute("advice") != null && !((String)request.getAttribute("advice")).isEmpty() ? request.getAttribute("advice") : "None" %></div>

    <!-- Document Footer -->
    <div class="prescription-footer">
      <div class="footer-brand">
        Subhadip Medlife Pharmacy 
      </div>
      <div class="signature-area">
        <div class="signature-line">Doctor's Signature</div>
      </div>
    </div>

  </div>

  <!-- Screen Actions (Hidden on Print) -->
  <div class="actions-toolbar">
    <a href="javascript:history.back()" class="btn btn-back">&larr; Edit Details</a>
    <button type="button" onclick="window.print()" class="btn btn-print">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="6 9 6 2 18 2 18 9"></polyline>
        <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
        <rect x="6" y="14" width="12" height="8"></rect>
      </svg>
      Print / Save as PDF
    </button>
  </div>

</div>

</body>
</html>