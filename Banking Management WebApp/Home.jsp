<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Portal BMS</title>
<style>
    :root {
        --primary-color: #d97706; /* Dark Yellow / Amber */
        --secondary-color: #b45309; /* Deep Amber */
        --accent-color: #fef3c7; /* Light Amber tint */
        --text-color: #1f2937;
        --bg-color: #fffbeb; /* Soft Yellowish background */
        --card-bg: #ffffff;
        --success-color: #047857;
        --border-color: #fde68a;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        margin: 0;
        padding: 40px 20px;
        line-height: 1.5;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        background: var(--card-bg);
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(217, 119, 6, 0.1);
        border-top: 5px solid var(--primary-color);
    }

    h1 {
        text-align: center;
        color: var(--primary-color);
        font-size: 26px;
        margin-bottom: 5px;
        letter-spacing: 0.5px;
    }

    .subtitle {
        text-align: center;
        color: #78350f;
        font-size: 15px;
        margin-bottom: 40px;
        font-weight: 500;
    }

    .module-card {
        background: #fff;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        padding: 24px;
        margin-bottom: 24px;
        transition: box-shadow 0.2s ease;
    }

    .module-card:hover {
        box-shadow: 0 4px 12px rgba(217, 119, 6, 0.08);
    }

    h3 {
        margin-top: 0;
        color: #1f2937;
        font-size: 17px;
        border-bottom: 2px solid var(--accent-color);
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 16px;
    }

    label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #78350f;
        margin-bottom: 6px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    input[type="text"],
    input[type="tel"],
    input[type="email"],
    select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cbd5e1;
        border-radius: 6px;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.2s;
    }

    input:focus, select:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 2px rgba(217, 119, 6, 0.2);
    }

    .btn-group {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }

    button {
        padding: 10px 18px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button[type="submit"] {
        background-color: var(--primary-color);
        color: white;
    }

    button[type="submit"]:hover {
        background-color: var(--secondary-color);
    }

    .reset-btn {
        background-color: #f1f5f9;
        color: #334155;
    }

    .reset-btn:hover {
        background-color: #e2e8f0;
    }

    .result-box {
        margin-top: 16px;
        padding: 12px;
        background: var(--accent-color);
        border-radius: 6px;
        font-size: 14px;
        border-left: 4px solid var(--primary-color);
    }

    .details-list {
        list-style: none;
        padding: 0;
        margin: 12px 0 0 0;
    }

    .details-list li {
        padding: 4px 0;
        font-size: 14px;
    }

    .highlight {
        color: var(--success-color);
        font-weight: 600;
    }
</style>
</head>
<body>

<div class="container">
    <h1>BANKING MANAGEMENT SYSTEM</h1>
    <div class="subtitle">Designed & Developed by Subhadip | Subhadip's Bank</div>

    <!-- 1. Create Account -->
    <div class="module-card">
        <h3>1. Create Account for Customer</h3>
        <form action="CreateServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber1" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Account Type</label>
                <select name="accounttype1" required>
                    <option value="" disabled selected>Select Account Type</option>
                    <option value="Savings">Savings</option>
                    <option value="Current">Current</option>              
                </select>
            </div>
            <div class="form-group">
                <label>Customer Name</label>
                <input type="text" name="name1" placeholder="Enter Customer Name" required>
            </div>
            <div class="form-group">
                <label>Customer Phone</label>
                <input type="tel" name="phone1" placeholder="Enter Customer Phone" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Customer Email</label>
                <input type="email" name="email1" placeholder="Enter Customer Email" required>
            </div>
            <div class="btn-group">
                <button type="submit">Submit</button></form>
                
                <form action="CreateServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
        
        <div class="result-box">
            <strong>Status:</strong> <span class="highlight">${SessionStatus}</span>
        </div>
    </div>

    <!-- 2. Search Customer Details -->
    <div class="module-card">
        <h3>2. Search Customer Details</h3>
        <form action="SearchServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber2" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="btn-group">
                <button type="submit">Search</button> </form>
                
                <form action="SearchServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
       
        <div class="result-box">
            <strong style="text-decoration: underline;">Customer's Details: <span class="highlight">${SessionStatus22}</span></strong>
            <ul class="details-list">
                <li><strong>Id:</strong> ${SessionId}</li>
                <li><strong>Name:</strong> ${SessionName}</li>
                <li><strong>Account Number:</strong> ${SessonAccountNumber}</li>
                <li><strong>Account Type:</strong> ${SessionAccountType}</li>
                <li><strong>Phone Number:</strong> ${SessionPhone}</li>
                <li><strong>Email:</strong> ${SessionEmail}</li>
                <li><strong>Kyc Status:</strong> ${SessionKyc}</li>
            </ul>
        </div>
    </div>

    <!-- 3. Deposit Money -->
    <div class="module-card">
        <h3>3. Deposit Money to Customer's Account</h3>
        <form action="DepositServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber3" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Deposit Amount</label>
                <input type="tel" name="depositamount3" placeholder="Enter Amount To Deposit" maxlength="10" required>
            </div>
            <div class="btn-group">
                <button type="submit">Submit</button></form>
                
                <form action="DepositServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
        
        <div class="result-box">
            <strong>Status:</strong> <span style="color:var(--secondary-color);">${SessionDeposited}</span><br><br>
            <strong>Amount:</strong> Rs. <span class="highlight">${SessionAmount}</span>
        </div>
    </div>

    <!-- 4. Withdraw Money -->
    <div class="module-card">
        <h3>4. Withdraw Money from Customer's Account</h3>
        <form action="WithdrawServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber4" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Withdraw Amount</label>
                <input type="tel" name="withdrawamount4" placeholder="Enter Amount To Withdraw" maxlength="10" required>
            </div>
            <div class="btn-group">
                <button type="submit">Submit</button></form>
                
                <form action="WithdrawServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
        
        <div class="result-box">
            <strong>Status:</strong> <span style="color:var(--secondary-color);">${SessionWith}</span><br><br>
            <strong>Amount:</strong> Rs. <span class="highlight">${SessionAmountWith}</span>
        </div>
    </div>

    <!-- 5. View Balance -->
    <div class="module-card">
        <h3>5. View Customer's Balance</h3>
        <form action="BalanceServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber5" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="btn-group">
                <button type="submit">Search</button></form>
                
                <form action="BalanceServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
        
        <div class="result-box">
            <strong>Account Number:</strong> ${SessionAcNo}<br><br>
            <strong>Current Balance:</strong> Rs. <span class="highlight">${SessionCurrentBalance}</span>
        </div>
    </div>

    <!-- 6. KYC Verification -->
    <div class="module-card">
        <h3>6. Customer KYC Verification</h3>
        <form action="KycServlet" method="post">
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountnumber6" placeholder="Enter Account Number" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Customer Phone</label>
                <input type="tel" name="phone6" placeholder="Enter Customer Phone" maxlength="10" required>
            </div>
            <div class="btn-group">
                <button type="submit">Verify</button> </form>
                <form action="KycServlet" method="get" style="display:inline;"><button type="submit" class="reset-btn">Reset</button></form>
            </div>
       
        <div class="result-box">
            <strong>Account Number:</strong> ${SessionKycAc}<br><br>
            <strong>KYC Status:</strong> <span class="highlight">${SessionKycVerify}</span>
        </div>
    </div>

</div>

</body>
</html>
