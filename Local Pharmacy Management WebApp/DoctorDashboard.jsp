<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Dashboard - Subhadip Medlife Pharmacy</title>
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
    --shadow-hover: 0 14px 28px -4px rgba(2, 132, 199, 0.08), 0 10px 10px -5px rgba(0, 0, 0, 0.02);
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
    max-width: 1100px;
    margin: 0 auto;
  }

  /* Header */
  .hero-header {
    text-align: center;
    margin-bottom: 36px;
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
    font-size: 2rem;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.02em;
    margin-bottom: 4px;
  }

  .hero-header p {
    color: var(--text-muted);
    font-size: 0.95rem;
  }

  /* Shared Card Style */
  .card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 28px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 28px;
  }

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid var(--border-light);
    padding-bottom: 16px;
    margin-bottom: 20px;
  }

  .card-header h2 {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-main);
  }

  .id-badge {
    background-color: #f1f5f9;
    color: var(--text-muted);
    font-size: 0.85rem;
    font-weight: 600;
    padding: 4px 12px;
    border-radius: 9999px;
    border: 1px solid var(--border-light);
  }

  /* Profile Layout */
  .profile-container {
    display: flex;
    align-items: center;
    gap: 24px;
  }

  .avatar-badge {
    width: 64px;
    height: 64px;
    border-radius: 16px;
    background-color: var(--primary-soft);
    color: var(--primary);
    font-weight: 700;
    font-size: 1.35rem;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }

  .profile-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    width: 100%;
  }

  .profile-item {
    display: flex;
    flex-direction: column;
  }

  .profile-item span {
    font-size: 0.78rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: var(--text-muted);
    font-weight: 600;
    margin-bottom: 4px;
  }

  .profile-item strong {
    font-size: 1.05rem;
    color: var(--text-main);
    font-weight: 600;
  }

  /* Appointments Table */
  .table-responsive {
    width: 100%;
    overflow-x: auto;
  }

  table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
  }

  th {
    background-color: #f8fafc;
    color: var(--text-muted);
    font-size: 0.8rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-weight: 600;
    padding: 14px 16px;
    border-bottom: 2px solid var(--border-light);
  }

  th:first-child {
    border-top-left-radius: 10px;
  }

  th:last-child {
    border-top-right-radius: 10px;
    text-align: right;
  }

  td {
    padding: 16px;
    font-size: 0.92rem;
    color: var(--text-main);
    border-bottom: 1px solid var(--border-light);
    vertical-align: middle;
  }

  td:last-child {
    text-align: right;
  }

  tr:last-child td {
    border-bottom: none;
  }

  tbody tr {
    transition: background-color 0.15s ease;
  }

  tbody tr:hover {
    background-color: #f8fafc;
  }

  .patient-name {
    font-weight: 600;
    color: var(--text-main);
  }

  .badge-tag {
    display: inline-block;
    background-color: #f1f5f9;
    color: #475569;
    font-size: 0.8rem;
    font-weight: 600;
    padding: 3px 8px;
    border-radius: 6px;
  }

  /* Prescribe Button */
  .btn-prescribe {
    background-color: var(--primary);
    color: #ffffff;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.88rem;
    font-weight: 600;
    font-family: inherit;
    transition: background-color 0.15s ease, transform 0.1s ease;
  }

  .btn-prescribe:hover {
    background-color: var(--primary-hover);
  }

  .btn-prescribe:active {
    transform: scale(0.98);
  }

  .no-data {
    text-align: center;
    color: var(--text-muted);
    padding: 36px 16px;
    font-size: 0.95rem;
    font-weight: 500;
  }

  @media (max-width: 640px) {
    .profile-container {
      flex-direction: column;
      align-items: flex-start;
    }
  }
</style>
</head>
<body>

<div class="container">

    <!-- Header -->
    <header class="hero-header">
        <div class="brand-badge">Doctor Workspace</div>
        <h1>Doctor Dashboard</h1>
        <p>Review appointed patients and manage consultations</p>
    </header>

    <!-- Doctor Profile Section -->
    <div class="card">
        <div class="card-header">
            <h2>Doctor Profile</h2>
            <span class="id-badge">ID: <%= session.getAttribute("doctorSessionId") != null ? session.getAttribute("doctorSessionId") : "" %></span>
        </div>
        <div class="profile-container">
            <div class="avatar-badge">Dr</div>
            <div class="profile-grid">
                <div class="profile-item">
                    <span>Doctor Name</span>
                    <strong>Dr. <%= session.getAttribute("doctorSessionName") != null ? session.getAttribute("doctorSessionName") : "" %></strong>
                </div>
                <div class="profile-item">
                    <span>Specialization</span>
                    <strong><%= session.getAttribute("doctorSessionSpec") != null ? session.getAttribute("doctorSessionSpec") : "" %></strong>
                </div>
                <div class="profile-item">
                    <span>Contact Phone</span>
                    <strong><%= session.getAttribute("doctorSessionPhone") != null ? session.getAttribute("doctorSessionPhone") : "" %></strong>
                </div>
            </div>
        </div>
    </div>

    <!-- Appointed Patients Section -->
    <div class="card">
        <div class="card-header">
            <h2>Patient Appointments</h2>
        </div>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Appt ID</th>
                        <th>Patient Name</th>
                        <th>Phone</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Map<String, String>> appointmentList = (List<Map<String, String>>) request.getAttribute("appointmentList");
                        if (appointmentList != null && !appointmentList.isEmpty()) {
                            for (Map<String, String> app : appointmentList) {
                    %>
                        <tr>
                            <td><span class="badge-tag">#<%= app.get("appointmentId") %></span></td>
                            <td class="patient-name"><%= app.get("patientName") %></td>
                            <td><%= app.get("patientPhone") %></td>
                            <td><%= app.get("patientGender") %></td>
                            <td><%= app.get("patientAge") %> yrs</td>
                            <td>
                                <form action="PrescriptionServlet" method="GET" style="margin:0;">
                                    <input type="hidden" name="appointmentId" value="<%= app.get("appointmentId") %>">
                                    <input type="hidden" name="patientName" value="<%= app.get("patientName") %>">
                                    <input type="hidden" name="patientAge" value="<%= app.get("patientAge") %>">
                                    <input type="hidden" name="patientGender" value="<%= app.get("patientGender") %>">
                                    <button type="submit" class="btn-prescribe">Prescribe</button>
                                </form>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="6" class="no-data">No appointments scheduled at this time.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>