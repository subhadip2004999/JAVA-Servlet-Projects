package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PrescriptionServlet")
public class PrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward patient details directly to the prescription view
        request.setAttribute("appointmentId", request.getParameter("appointmentId"));
        request.setAttribute("patientName", request.getParameter("patientName"));
        request.setAttribute("patientAge", request.getParameter("patientAge"));
        request.setAttribute("patientGender", request.getParameter("patientGender"));

        request.getRequestDispatcher("Prescription.jsp").forward(request, response);
    }
}