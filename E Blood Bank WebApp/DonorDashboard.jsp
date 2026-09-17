<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="myPackage.BloodRequest" %>

<%
    // 1. Prevent the browser from caching the page. 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 

    // 2. Verify Session
    String sessionEmail = (String) session.getAttribute("Email");

    if (sessionEmail == null) {
        response.sendRedirect("DonorLogin.jsp");
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Dashboard - E-blood Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* CSS Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #000000;
            color: #ffffff;
            line-height: 1.6;
            padding-bottom: 60px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Top Navigation */
        .top-nav {
            padding: 20px 0;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #1a1a1a;
            margin-bottom: 40px;
        }

        .btn-home {
            color: #a3a3a3;
            text-decoration: none;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.2s;
        }

        .btn-home:hover {
            color: #ffffff;
        }

        /* Dashboard Header */
        .dashboard-header {
            margin-bottom: 30px;
        }

        .dashboard-header h1 {
            font-size: 3rem;
            align-text: center;
            font-weight: 600;
            color: rgb(255, 0, 0);
        }

        .dashboard-header p {
            color: #a3a3a3;
            font-size: 1rem;
        }

        /* Sections & Cards */
        .section-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: rgb(0, 128, 192);           
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card {
            background-color: #121212;
            border: 1px solid #262626;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 40px;
        }

        /* Donor Details Grid */
        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .detail-item label {
            display: block;
            color: #a3a3a3;
            font-size: 0.85rem;
            margin-bottom: 5px;
        }

        .detail-item p {
            font-size: 1rem;
            color: #ffffff;
            font-weight: 500;
        }

        .blood-badge {
            display: inline-block;
            background-color: #2a1111;
            color: #ff6b6b;
            padding: 4px 12px;
            border-radius: 4px;
            font-weight: 600;
        }

        /* Blood Requests Table */
        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #262626;
        }

        th {
            color: #a3a3a3;
            font-size: 0.85rem;
            font-weight: 500;
            text-transform: uppercase;
        }

        td {
            font-size: 0.95rem;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .status-urgent {
            color: #ff6b6b;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .btn-contact {
            background-color: #102a43;
            color: #62b0ff;
            border: 1px solid #1f4068;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.85rem;
            transition: opacity 0.2s;
        }

        .btn-contact:hover {
            opacity: 0.8;
        }
        
        .empty-state {
            text-align: center;
            color: #a3a3a3;
            padding: 30px;
        }

        /* Bottom Actions */
        .bottom-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 20px;
            border-top: 1px solid #1a1a1a;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: opacity 0.2s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-outline {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #333333;
        }

        .btn-outline:hover {
            background-color: #1a1a1a;
        }

        .btn-danger {
            background-color: #d93838;
            color: white;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .bottom-actions {
                flex-direction: column;
                gap: 15px;
            }
            .btn {
                width: 100%;
                text-align: center;
            }
            form {
                width: 100%;
            }
            form .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Top Navigation -->
    <div class="container">
        <nav class="top-nav">
            <a href="Landing.jsp" class="btn-home">
                <i class="fas fa-arrow-left"></i> Go Home
            </a>
        </nav>
    </div>

    <div class="container">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h1 style="align-text:Center;">Donor Dashboard</h1><br/><br/>
            <h2>${yourName}</h2>
            <p>Welcome back! Manage your profile and view recent blood requests.</p>
        </div>

        <!-- Section 1: Donor Details -->
        <h2 class="section-title"><i class="far fa-id-card"></i> Donor Details</h2>
        <div class="card">
            <div class="details-grid">
                <div class="detail-item">
                    <label>Registered Email</label>
                    <p><%= sessionEmail %></p> 
                </div>
                <!-- You can also dynamically map these using ${donor.bloodGroup} etc. if passed from servlet -->
                <div class="detail-item">
                    <label>Blood Group</label>
                    <p><span class="blood-badge">${yourBlood}</span></p>
                </div>
                <div class="detail-item">
                    <label>Phone Number</label>
                    <p>${yourPhone}</p>
                </div>
                <div class="detail-item">
                    <label>City</label>
                    <p>${yourCity}</p>
                </div>
            </div>
        </div>

<!-- Section 2: Blood Requests (Dynamic List) -->
        <h2 class="section-title"><i class="fas fa-hand-holding-water"></i> Targeted Blood Requests</h2>
        <div class="card">
            <% 
                // Fetch the list passed from LoginServlet
                List<BloodRequest> reqList = (List<BloodRequest>) request.getAttribute("requestList"); 
                
                // If the list is null or empty, show the empty state message
                if (reqList == null || reqList.isEmpty()) { 
            %>
                <div class="empty-state">
                    No urgent blood requests targeted to you at the moment.
                </div>
            <% 
                } else { 
            %>
                <!-- Showing requested blood in ordered wise using <ol> -->
                <ol style="padding-left: 20px; color: #d4d4d4;">
                    <% 
                        // Loop through the list and print each request
                        for (BloodRequest req : reqList) { 
                    %>
                        <li style="margin-bottom: 20px; border-bottom: 1px solid #262626; padding-bottom: 15px;">
                            <p style="margin-bottom: 8px;">
                                <strong style="color: #fff;">Patient Name:</strong> <%= req.getPatientName() %> | 
                                <strong style="color: #fff;">Required Group:</strong> <span class="blood-badge"><%= req.getBloodGroup() %></span>
                            </p>
                            <p style="margin-bottom: 12px;">
                                <strong style="color: #fff;">Hospital / Location:</strong> <%= req.getHospitalLocation() %> | 
                                <strong style="color: #fff;">Contact:</strong> <%= req.getContactNumber() %>
                            </p>
                            <h3 style="color:red">Call the patient as soon as possible !!</h3> <p>Your blood can save a life ❤️ |  After call, reach the destination hospital.</p>
                        </li>
                    <% 
                        } 
                    %>
                </ol>
            <% 
                } 
            %>
        </div>
        
        <!-- Section 3: Bottom Actions -->
        <div class="bottom-actions">
            <!-- Logout Button -->
            <a href="DonorLogin.jsp" class="btn btn-outline">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>

            <!-- Delete Account Button -->
            <form action="DeleteDonorServlet.java" method="post">
                <input type="hidden" name="deleteEmail" value="<%= sessionEmail %>">
                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to permanently delete your account? This action cannot be undone.');">
                    <i class="fas fa-trash-alt"></i> Delete Account
                </button>
            </form>
        </div>
    </div>

</body>
</html>