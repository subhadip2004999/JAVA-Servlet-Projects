package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/FetchDonorServlet")
public class FetchDonorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestBloodGroup = request.getParameter("blood2");
        String requestCity = request.getParameter("city2");
        
        // Retrieve patient details to pass along to the next page
        String patientName = request.getParameter("name2");
        String patientPhone = request.getParameter("phone2");
        String patientLocation = request.getParameter("location2");

        try {
            Class.forName("org.postgresql.Driver");
            String URL = "url";
            Connection con2 = DriverManager.getConnection(URL);
            
            String query2 = "SELECT * FROM donor_table WHERE \"City\" = ? AND \"BloodGroup\" = ?";
            PreparedStatement ps2 = con2.prepareStatement(query2);
            ps2.setString(1, requestCity);
            ps2.setString(2, requestBloodGroup);
            
            ResultSet rs = ps2.executeQuery();
            List<Donor> donorList = new ArrayList<>();
            
            while (rs.next()) {
                Donor d = new Donor();
                d.setName(rs.getString("Name"));
                d.setEmail(rs.getString("Email"));
                d.setPhone(rs.getString("Phone"));
                donorList.add(d);
            }
            
            // Pass donors and patient details to the JSP
            request.setAttribute("donorList", donorList);
            request.setAttribute("pName", patientName);
            request.setAttribute("pPhone", patientPhone);
            request.setAttribute("pBlood", requestBloodGroup);
            request.setAttribute("pCity", requestCity);
            request.setAttribute("pLocation", patientLocation);
            
            RequestDispatcher rd = request.getRequestDispatcher("AvailableDonors.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}