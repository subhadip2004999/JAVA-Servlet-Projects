package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/RequestedDonorServlet")
public class RequestedDonorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // FIXED: Fetching the donorEmail sent from AvailableDonors.jsp
        String donorEmail = request.getParameter("donorEmail");
        String pName = request.getParameter("pName");
        String pPhone = request.getParameter("pPhone");
        String pBlood = request.getParameter("pBlood");
        String pCity = request.getParameter("pCity");
        String pLocation = request.getParameter("pLocation");
        
        try {
            Class.forName("org.postgresql.Driver");
            String URL = "url";
            Connection con = DriverManager.getConnection(URL);
            
            // FIXED: Included "donoremail" in the INSERT statement (total 6 columns/placeholders)
            String query = "INSERT INTO blood_requests_table(\"PatientPhone\", \"PatientName\", \"PatientBloodGroup\", \"PatientCity\", \"PatientLocation\", \"donoremail\") VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            long phoneNum = Long.parseLong(pPhone);
            ps.setLong(1, phoneNum);
            ps.setString(2, pName);
            ps.setString(3, pBlood);
            ps.setString(4, pCity);
            ps.setString(5, pLocation);
            ps.setString(6, donorEmail); // FIXED: Passing the donor email into the 6th slot
            
            int res = ps.executeUpdate();
            
            if(res > 0) {
                RequestDispatcher rd3 = request.getRequestDispatcher("BloodRequested.jsp");
                rd3.forward(request, response); 
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("<h2 style='color:red;'>Database insertion failed, but no exception was thrown.</h2>");
            }
            
            ps.close();
            con.close();
            
        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.print("<div style='background-color: #fff; color: #000; padding: 20px; font-family: sans-serif; border-radius: 8px;'>");
            out.print("<h2 style='color: red;'>Server or Database Error!</h2>");
            out.print("<p><b>Error Message:</b> " + e.getMessage() + "</p>");
            out.print("</div>");
            e.printStackTrace();
        }
    }
}