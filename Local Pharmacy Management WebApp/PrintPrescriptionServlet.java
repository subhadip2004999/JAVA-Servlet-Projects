package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/PrintPrescriptionServlet")
public class PrintPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PrintPrescriptionServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect patient information
        request.setAttribute("appointmentId", request.getParameter("appointmentId"));
        request.setAttribute("patientName", request.getParameter("patientName"));
        request.setAttribute("patientAge", request.getParameter("patientAge"));
        request.setAttribute("patientGender", request.getParameter("patientGender"));

        // Collect medical details
        request.setAttribute("diagnosis", request.getParameter("diagnosis"));
        request.setAttribute("medicines", request.getParameter("medicines"));
        request.setAttribute("advice", request.getParameter("advice"));

        // Forward to printable prescription view
        RequestDispatcher rd = request.getRequestDispatcher("PrintPrescription.jsp");
        rd.forward(request, response);
    }
}