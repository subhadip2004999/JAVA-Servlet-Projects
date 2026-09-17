<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subhadip Medlife Pharmacy - Book Appointment</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --bg-surface: #f8fafc;
    --card-bg: #ffffff;
    --primary: #0284c7;
    --primary-soft: #e0f2fe;
    --accent-mint: #ecfdf5;
    --accent-mint-text: #059669;
    --text-main: #1e293b;
    --text-muted: #64748b;
    --border-card: #cbd5e1; /* Enhanced visible border */
    --border-hover: #38bdf8;
    --border-light: #e2e8f0;
    --shadow-soft: 0 10px 25px -5px rgba(0, 0, 0, 0.04), 0 8px 10px -6px rgba(0, 0, 0, 0.02);
    --shadow-hover: 0 14px 28px -4px rgba(2, 132, 199, 0.12), 0 10px 10px -5px rgba(0, 0, 0, 0.02);
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
    max-width: 1080px;
    margin: 0 auto;
  }

  /* Header Section */
  .hero-header {
    text-align: center;
    margin-bottom: 48px;
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
    letter-spacing: 0.02em;
  }

  .brand-badge::before {
    content: "";
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background-color: var(--accent-mint-text);
  }

  .hero-header h1 {
    font-size: 2.1rem;
    font-weight: 700;
    color: var(--text-main);
    letter-spacing: -0.02em;
    margin-bottom: 6px;
  }

  .hero-header p {
    color: var(--text-muted);
    font-size: 1.05rem;
  }

  /* Doctors Grid */
  .doctor-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 24px;
    margin-bottom: 56px;
  }

  /* Doctor Card with Clear Border */
  .doctor-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 24px;
    box-shadow: var(--shadow-soft);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
  }

  .doctor-card:hover {
    transform: translateY(-3px);
    box-shadow: var(--shadow-hover);
    border-color: var(--border-hover);
  }

  .doctor-header {
    display: flex;
    align-items: center;
    gap: 14px;
    margin-bottom: 16px;
  }

  .avatar-badge {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    background-color: var(--primary-soft);
    color: var(--primary);
    font-weight: 700;
    font-size: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }

  .doctor-card h3 {
    font-size: 1.15rem;
    font-weight: 600;
    color: var(--text-main);
    letter-spacing: -0.01em;
  }

  .specialty-pill {
    display: inline-block;
    background-color: #f1f5f9;
    color: #475569;
    font-size: 0.8rem;
    font-weight: 600;
    padding: 4px 10px;
    border-radius: 6px;
    margin-bottom: 12px;
  }

  .schedule-box {
    background-color: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 10px 12px;
    margin-bottom: 20px;
  }

  .schedule-label {
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: var(--text-muted);
    font-weight: 600;
    margin-bottom: 2px;
  }

  .schedule-text {
    font-size: 0.88rem;
    color: var(--text-main);
    font-weight: 500;
  }

  /* Booking Button */
  .book-btn {
    width: 100%;
    background-color: var(--primary);
    color: #ffffff;
    border: none;
    border-radius: 10px;
    padding: 11px 16px;
    font-size: 0.95rem;
    font-weight: 600;
    cursor: pointer;
    font-family: inherit;
    transition: background-color 0.15s ease, transform 0.1s ease;
  }

  .book-btn:hover {
    background-color: #0369a1;
  }

  .book-btn:active {
    transform: scale(0.99);
  }

  /* Footer Card */
  .footer-card {
    background-color: var(--card-bg);
    border: 2px solid var(--border-card);
    border-radius: 16px;
    padding: 32px 24px;
    box-shadow: var(--shadow-soft);
    text-align: center;
  }

  .footer-card h2 {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-main);
    margin-bottom: 16px;
  }

  .info-pills {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 12px;
  }

  .info-pill {
    background-color: #f8fafc;
    border: 1px solid var(--border-light);
    padding: 8px 16px;
    border-radius: 9999px;
    font-size: 0.88rem;
    color: var(--text-muted);
    font-weight: 500;
  }

  .info-pill strong {
    color: var(--text-main);
  }

  @media (max-width: 640px) {
    .hero-header h1 {
      font-size: 1.75rem;
    }
    .info-pills {
      flex-direction: column;
      align-items: center;
    }
    .info-pill {
      width: 100%;
      border-radius: 10px;
    }
  }
</style>
</head>
<body>

<div class="container">

  <!-- Hero Header -->
  <header class="hero-header">
    <div class="brand-badge">Verified Healthcare &amp; Pharmacy</div>
    <h1>Subhadip Medlife Pharmacy</h1>
    <p>Choose your doctor and book your consultation slot</p>
  </header>

  <!-- Doctor Selection Cards -->
  <div class="doctor-grid">

    <!-- Doctor 1 -->
    <div class="doctor-card">
      <div>
        <div class="doctor-header">
          <div class="avatar-badge">SB</div>
          <h3>Dr. Subhadip Biswas</h3>
        </div>
        <span class="specialty-pill">General Physician</span>
        <div class="schedule-box">
          <div class="schedule-label">Available Hours</div>
          <div class="schedule-text">Monday to Saturday &bull; 5:00 PM - 9:00 PM</div>
        </div>
      </div>
      <form action="DoctorChoice" method="post">
        <input type="hidden" value="11111" name="doctorid">
        <button type="submit" class="book-btn">Book Appointment</button>
      </form>
    </div>

    <!-- Doctor 2 -->
    <div class="doctor-card">
      <div>
        <div class="doctor-header">
          <div class="avatar-badge" style="background-color: #ecfdf5; color: #059669;">SB</div>
          <h3>Dr. Suman Bawali</h3>
        </div>
        <span class="specialty-pill">Child Specialist</span>
        <div class="schedule-box">
          <div class="schedule-label">Available Hours</div>
          <div class="schedule-text">Monday to Saturday &bull; 8:00 AM - 12:00 PM</div>
        </div>
      </div>
      <form action="DoctorChoice" method="post">
        <input type="hidden" value="22222" name="doctorid">
        <button type="submit" class="book-btn">Book Appointment</button>
      </form>
    </div>

    <!-- Doctor 3 -->
    <div class="doctor-card">
      <div>
        <div class="doctor-header">
          <div class="avatar-badge" style="background-color: #fef3c7; color: #d97706;">AD</div>
          <h3>Dr. Ayush Deb</h3>
        </div>
        <span class="specialty-pill">General Physician</span>
        <div class="schedule-box">
          <div class="schedule-label">Available Hours</div>
          <div class="schedule-text">Wed &amp; Sun &bull; 7:00 PM - 10:00 PM</div>
        </div>
      </div>
      <form action="DoctorChoice" method="post">
        <input type="hidden" value="33333" name="doctorid">
        <button type="submit" class="book-btn">Book Appointment</button>
      </form>
    </div>

    <!-- Doctor 4 -->
    <div class="doctor-card">
      <div>
        <div class="doctor-header">
          <div class="avatar-badge" style="background-color: #f3e8ff; color: #7c3aed;">SD</div>
          <h3>Dr. Santanu Dutta</h3>
        </div>
        <span class="specialty-pill">ENT Specialist</span>
        <div class="schedule-box">
          <div class="schedule-label">Available Hours</div>
          <div class="schedule-text">Everyday &bull; 9:00 PM - 11:00 AM</div>
        </div>
      </div>
      <form action="DoctorChoice" method="post">
        <input type="hidden" value="44444" name="doctorid">
        <button type="submit" class="book-btn">Book Appointment</button>
      </form>
    </div>

  </div>

  <!-- Footer & Contact Details -->
  <footer class="footer-card">
    <h2>Thank you for choosing our pharmacy</h2>
    <div class="info-pills">
      <div class="info-pill"><strong>Owner:</strong> Subhadip</div>
      <div class="info-pill"><strong>Contact:</strong> 7890987890</div>
      <div class="info-pill"><strong>Email:</strong> businesssubhadip@gmail.com</div>
      <div class="info-pill"><strong>Address:</strong> Kolkata, India, 700120</div>
    </div>
  </footer>

</div>

</body>
</html>