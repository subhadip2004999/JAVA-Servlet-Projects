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

@WebServlet("/PatientDetailsServlet") // FIXED: Space removed
public class PatientDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public PatientDetailsServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String requestName = request.getParameter("name2");
        String requestBloodGroup = request.getParameter("blood2");
        String requestCity = request.getParameter("city2");
        String requestPhone = request.getParameter("phone2");
        String requestLocation = request.getParameter("location2");
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        try {
            Class.forName("org.postgresql.Driver");
            String URL = "url";
            Connection con = DriverManager.getConnection(URL);
            
            // FIXED: Added the missing comma before "PatientLocation"
            String query = "INSERT INTO blood_requests_table(\"PatientPhone\", \"PatientName\", \"PatientBloodGroup\", \"PatientCity\", \"PatientLocation\") VALUES(?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            // FIXED: Converted the string to a 'long' to match the 'int8' database type
            long phoneNum = Long.parseLong(requestPhone);
            ps.setLong(1, phoneNum);
            
            ps.setString(2, requestName);
            ps.setString(3, requestBloodGroup);
            ps.setString(4, requestCity);
            ps.setString(5, requestLocation);
            
            int result = ps.executeUpdate();
            
            if(result > 0) {
                session.setAttribute("successMessage", "Blood request logged!");
                RequestDispatcher rd = request.getRequestDispatcher("FetchDonorServlet");
                rd.include(request, response);
            } else {
                out.print("<h2 style='color:red'>Try again</h2>");
                RequestDispatcher rd = request.getRequestDispatcher("PatientDetailsForm.jsp");
                rd.include(request, response);
            }
            
            ps.close();
            con.close();
            
        } catch (Exception e) {
            // FIXED: Will now print the actual error to your browser
            out.print("<h2 style='color:red; text-align:center;'>Database Error: " + e.getMessage() + "</h2>");
            e.printStackTrace();
            RequestDispatcher rd = request.getRequestDispatcher("PatientDetailsForm.jsp");
            rd.include(request, response);
        }
    }
}