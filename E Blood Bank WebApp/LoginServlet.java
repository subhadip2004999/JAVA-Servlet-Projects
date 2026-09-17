package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class DonorLoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
    
    
 // Use doGet because clicking an <a> link in HTML always sends a GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Fetch the current session (passing 'false' means it won't create a new one if it doesn't exist)
        HttpSession session = request.getSession(false);
        
        // 2. If a session exists, completely destroy it and all attached variables
        if (session != null) {
            session.removeAttribute("Email");
            session.removeAttribute("yourName");
            session.removeAttribute("yourBlood");
            session.removeAttribute("yourPhone");
            session.removeAttribute("yourCity");
            
            // Invalidate kills the session entirely on the server
            session.invalidate(); 
        }
        
        // 3. Redirect the user back to the login page safely
        response.sendRedirect("DonorLogin.jsp");
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Fetch inputs from your DonorLogin.jsp form (Make sure your HTML input names are "email" and "password")
        String usrEmail = request.getParameter("email");
        String usrPassword = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        try {
            // 1. Database Connection (Using your exact reference)
            Class.forName("org.postgresql.Driver");
            String URL = "url";
            Connection con = DriverManager.getConnection(URL);
            
            // 2. Query to match Email and Password
            String query = "SELECT * FROM donor_table WHERE \"Email\" = ? AND \"Password\" = ?";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, usrEmail);
            ps.setString(2, usrPassword);
            
            ResultSet rs = ps.executeQuery();
            
            // 3. Check if a match was found
            if(rs.next()) {
                
            	// === LOGIN SUCCESSFUL ===
                
            	// Set the session and save ALL donor details
            	HttpSession session = request.getSession();
            	session.setAttribute("Email", usrEmail);
            	session.setAttribute("yourName", rs.getString("Name"));
            	session.setAttribute("yourBlood", rs.getString("BloodGroup"));
            	session.setAttribute("yourPhone", rs.getString("Phone"));
            	session.setAttribute("yourCity", rs.getString("City"));
                
             // ... inside LoginServlet.java after session.setAttribute("Email", usrEmail); ...

            	// Fetch targeted blood requests for THIS donor with console debugging
                System.out.println("--- DEBUG START ---");
                System.out.println("Logged-in User Email: [" + usrEmail + "]");

                String reqQuery = "SELECT * FROM blood_requests_table WHERE LOWER(TRIM(\"donoremail\")) = LOWER(TRIM(?))";
                PreparedStatement psReq = con.prepareStatement(reqQuery);
                psReq.setString(1, usrEmail); 
                ResultSet rsReq = psReq.executeQuery();

                List<BloodRequest> requestList = new ArrayList<>();

                while (rsReq.next()) {
                    System.out.println("MATCH FOUND! Patient: " + rsReq.getString("PatientName"));
                    BloodRequest req = new BloodRequest();
                    req.setPatientName(rsReq.getString("PatientName"));
                    req.setBloodGroup(rsReq.getString("PatientBloodGroup")); 
                    req.setHospitalLocation(rsReq.getString("PatientLocation")); 
                    req.setContactNumber(rsReq.getString("PatientPhone")); 
                    requestList.add(req);
                }
                
                System.out.println("Total requests added to list: " + requestList.size());
                System.out.println("--- DEBUG END ---");

                request.setAttribute("requestList", requestList);
                RequestDispatcher rd = request.getRequestDispatcher("DonorDashboard.jsp");
                rd.forward(request, response);
            } else {
                
                // === LOGIN FAILED (Wrong Email or Password) ===
                
                out.print("<h2 style='color:red'>Invalid Email or Password. Try again.</h2>");
                RequestDispatcher rd = request.getRequestDispatcher("DonorLogin.jsp");
                rd.include(request, response);
                
            }
            
            // Close the database connection
            con.close();
            
        } catch (Exception e) {
            // === ERROR HANDLING ===
            out.print("<h2 style='color:red'>Error: " + e.getMessage() + "</h2>");
            RequestDispatcher rd = request.getRequestDispatcher("DonorLogin.jsp");
            rd.include(request, response);
        }
    }
}