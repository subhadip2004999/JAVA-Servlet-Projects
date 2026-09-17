<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="myPackage.Donor" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Donors</title>
    <style>
        body { background-color: #000; color: #fff; font-family: 'Inter', sans-serif; padding: 40px; }
        .donor-list { font-size: 1.1rem; padding-left: 20px; max-width: 600px; margin: 0 auto; }
        .donor-list li { margin-bottom: 20px; background: #121212; padding: 25px; border-radius: 8px; border: 1px solid #262626; }
        .btn-request { background-color: #d93838; color: white; border: none; padding: 12px 20px; border-radius: 6px; cursor: pointer; margin-top: 15px; font-size: 1rem; }
        .btn-request:hover { opacity: 0.9; }
        .header-title { text-align: center; margin-bottom: 30px; color: #e53935; }
    </style>
</head>
<body>
    <h2 class="header-title">Available Donors in <%= request.getAttribute("pCity") %> for <%= request.getAttribute("pBlood") %></h2>
    
    <% 
        // We use native Java here to fetch the list sent from FetchDonorServlet
        List<Donor> donorList = (List<Donor>) request.getAttribute("donorList");
        
        // If the database found no matches, show the empty message
        if (donorList == null || donorList.isEmpty()) { 
    %>
        <p style="text-align: center; color: #a3a3a3; font-size: 1.1rem;">No donors found in this city for this blood group.</p>
    <%  
        } else { 
    %>
        <!-- If donors exist, loop through them and create the ordered list -->
        <ol class="donor-list">
            <% for (Donor donor : donorList) { %>
                <li>
                    <strong style="color: #a3a3a3;">Name:</strong> <%= donor.getName() %> <br>
                    <strong style="color: #a3a3a3;">Phone:</strong> <%= donor.getPhone() %> <br>
                    
                    <form action="RequestedDonorServlet" method="post">
                        <!-- Hidden inputs pass the patient's data along to the final servlet -->
                        <input type="hidden" name="donorEmail" value="<%= donor.getEmail() %>">
                        <input type="hidden" name="pName" value="<%= request.getAttribute("pName") %>">
                        <input type="hidden" name="pPhone" value="<%= request.getAttribute("pPhone") %>">
                        <input type="hidden" name="pBlood" value="<%= request.getAttribute("pBlood") %>">
                        <input type="hidden" name="pCity" value="<%= request.getAttribute("pCity") %>">
                        <input type="hidden" name="pLocation" value="<%= request.getAttribute("pLocation") %>">
                        
                        <button type="submit" class="btn-request">Send Request</button>
                    </form>
                </li>
            <% } %>
        </ol>
    <% 
        } 
    %>
</body>
</html>