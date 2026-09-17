package myPackage;

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
import java.sql.Statement;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "Your url";

    public AdminServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(DB_URL);

            if ("addDoctor".equalsIgnoreCase(action)) {
                // 1. Collect form parameters
                String dId = request.getParameter("dId");
                String name = request.getParameter("dName");
                String specialization = request.getParameter("dSpecialization");
                String phone = request.getParameter("dPhone");
                String password = request.getParameter("dPassword");

                // 2. Insert into doctor_table
                String insertSql = "INSERT INTO doctor_table (\"DId\", \"Name\", \"Specialization\", \"Phone\", \"Password\") VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(insertSql);
                ps.setString(1, dId);
                ps.setString(2, name);
                ps.setString(3, specialization);
                ps.setString(4, phone);
                ps.setString(5, password);

                int rowsInserted = ps.executeUpdate();
                ps.close();

                if (rowsInserted > 0) {
                    out.println("<script>alert('Doctor added successfully!'); window.location='AdminPortal.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to add doctor.'); window.location='AdminPortal.jsp';</script>");
                }

            } else if ("deleteAppointments".equalsIgnoreCase(action)) {
                // Delete all rows in appointment_table
                Statement stmt = con.createStatement();
                stmt.executeUpdate("TRUNCATE TABLE appointment_table RESTART IDENTITY");
                stmt.close();

                out.println("<script>alert('All records from appointment_table have been deleted.'); window.location='AdminPortal.jsp';</script>");

            } else if ("deletePatients".equalsIgnoreCase(action)) {
                // Truncate patient_table and cascade delete any remaining linked appointments
                Statement stmt = con.createStatement();
                stmt.executeUpdate("TRUNCATE TABLE patient_table CASCADE");
                stmt.close();

                out.println("<script>alert('All records from patient_table have been deleted.'); window.location='AdminPortal.jsp';</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage().replace("'", "\\'") + "'); window.location='AdminPortal.jsp';</script>");
        }
    }
}