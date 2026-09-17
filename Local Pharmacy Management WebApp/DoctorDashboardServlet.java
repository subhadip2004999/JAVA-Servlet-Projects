package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/DoctorDashboardServlet")
public class DoctorDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorDashboardServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("dId1");
        String PASSWORD = request.getParameter("dPassword1");
        HttpSession session = request.getSession();

        try {
            Class.forName("org.postgresql.Driver");
            String URL = "url";

            Connection con = DriverManager.getConnection(URL);

            // 1. Authenticate Doctor (Fixed missing WHERE keyword)
            String loginSql = "SELECT * FROM doctor_table WHERE \"DId\" = ? AND \"Password\" = ?";
            PreparedStatement ps = con.prepareStatement(loginSql);
            ps.setString(1, ID);
            ps.setString(2, PASSWORD);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("doctorSessionId", rs.getString("DId"));
                session.setAttribute("doctorSessionName", rs.getString("Name"));
                session.setAttribute("doctorSessionSpec", rs.getString("Specialization"));
                session.setAttribute("doctorSessionPhone", rs.getString("Phone"));

                // 2. Fetch Appointments for this Doctor joined with Patient details
                String appointmentSql = "SELECT a.id AS app_id, p.\"Name\" AS patient_name, " +
                                       "p.\"Phone\" AS patient_phone, p.\"Gender\" AS patient_gender, " +
                                       "p.\"Age\" AS patient_age " +
                                       "FROM appointment_table a " +
                                       "JOIN patient_table p ON a.\"PatientId\" = p.\"Id\" " +
                                       "WHERE a.\"DoctorId\" = ?";

                PreparedStatement psApp = con.prepareStatement(appointmentSql);
                psApp.setString(1, ID);

                ResultSet rsApp = psApp.executeQuery();

                List<Map<String, String>> appointmentList = new ArrayList<>();
                while (rsApp.next()) {
                    Map<String, String> app = new HashMap<>();
                    app.put("appointmentId", rsApp.getString("app_id"));
                    app.put("patientName", rsApp.getString("patient_name"));
                    app.put("patientPhone", rsApp.getString("patient_phone"));
                    app.put("patientGender", rsApp.getString("patient_gender"));
                    app.put("patientAge", rsApp.getString("patient_age"));
                    appointmentList.add(app);
                }

                // 3. Pass appointment list to the JSP view
                request.setAttribute("appointmentList", appointmentList);

                RequestDispatcher rd = request.getRequestDispatcher("DoctorDashboard.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Invalid Doctor ID or Password.");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}