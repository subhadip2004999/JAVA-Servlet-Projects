
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subhadip's Weather App</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  }

  body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, rgba(15, 23, 42, 0.75), rgba(30, 58, 138, 0.75)),
                url('https://images.unsplash.com/photo-1534088568595-a066f410bcda?q=80&w=1920&auto=format&fit=crop') no-repeat center center/cover;
    color: #ffffff;
    padding: 20px;
  }

  .weather-card {
    background: rgba(255, 255, 255, 0.12);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    border: 1px solid rgba(255, 255, 255, 0.25);
    border-radius: 28px;
    padding: 40px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 30px 60px rgba(0, 0, 0, 0.35);
    text-align: center;
    animation: fadeIn 0.8s ease-out;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .location-header h1 {
    font-size: 2rem;
    font-weight: 700;
    letter-spacing: -0.5px;
    margin-bottom: 4px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.2);
  }

  .location-header p {
    font-size: 0.9rem;
    color: rgba(255, 255, 255, 0.75);
    font-weight: 400;
  }

  .weather-main {
    margin: 32px 0;
  }

  .temperature {
    font-size: 4.5rem;
    font-weight: 300;
    line-height: 1;
    margin-bottom: 8px;
    letter-spacing: -2px;
  }

  .temperature span {
    font-size: 2.5rem;
    vertical-align: top;
    font-weight: 400;
  }

  .condition {
    font-size: 1.25rem;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: capitalize;
    color: rgba(255, 255, 255, 0.9);
  }

  .divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
    margin: 24px 0;
  }

  .metrics-grid {
    display: flex;
    justify-content: space-around;
    align-items: center;
  }

  .metric-item {
    display: flex;
    align-items: center;
    gap: 12px;
    text-align: left;
  }

  .metric-icon {
    width: 24px;
    height: 24px;
    fill: none;
    stroke: rgba(255, 255, 255, 0.85);
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  .metric-info label {
    display: block;
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: rgba(255, 255, 255, 0.65);
    margin-bottom: 2px;
  }

  .metric-info span {
    font-size: 1.1rem;
    font-weight: 600;
  }

  /* Search Again Button Styling */
  .search-again-container {
    margin-top: 28px;
  }

  .btn-search-again {
    width: 100%;
    padding: 14px 20px;
    font-size: 0.95rem;
    font-weight: 600;
    letter-spacing: 0.5px;
    color: #ffffff;
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.4);
    border-radius: 16px;
    cursor: pointer;
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    transition: all 0.25s ease;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
  }

  .btn-search-again:hover {
    background: rgba(255, 255, 255, 0.35);
    border-color: rgba(255, 255, 255, 0.7);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
  }

  .btn-search-again:active {
    transform: translateY(0);
  }
</style>
</head>
<body>

  <div class="weather-card">
    <div class="location-header">
      <h1>${city}</h1>
      <p>${date}</p>
    </div>

    <div class="weather-main">
      <div class="temperature">${temperature}<span>°C</span></div>
      <div class="condition">${weatherCondition}</div>
    </div>

    <div class="divider"></div>

    <div class="metrics-grid">
      <div class="metric-item">
        <svg class="metric-icon" viewBox="0 0 24 24">
          <path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"></path>
        </svg>
        <div class="metric-info">
          <label>Humidity</label>
          <span>${humidity}%</span>
        </div>
      </div>
    </div>

    <!-- Search Again Form Button -->
    <div class="search-again-container">
      <form action="home.html" method="get">
        <button type="submit" class="btn-search-again">🔍 Search Again</button>
      </form>
    </div>
  </div>

</body>
</html>