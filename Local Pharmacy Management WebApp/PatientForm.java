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

/**
 * Servlet implementation class PatientForm
 */
@WebServlet("/PatientForm")
public class PatientForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientForm() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String phone = request.getParameter("phone1");
		String name = request.getParameter("name1");
		String age = request.getParameter("age1");
		String gender = request.getParameter("gender1");
		
		String did = request.getParameter("dId");
		String dname = request.getParameter("dName");
		String dspec = request.getParameter("dSpec");
		String dphone = request.getParameter("dPhone");
		
		HttpSession session = request.getSession();
		
		try { 
			Class.forName("org.postgresql.Driver");
			String URL = "url";
			
			Connection con = DriverManager.getConnection(URL);
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO patient_table (\"Name\",\"Phone\",\"Gender\",\"Age\") VALUES (?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, gender);
			ps.setString(4, age);
			
			int res = ps.executeUpdate();
			
			
if(res > 0) {
				
				String query = "SELECT \"Id\" FROM patient_table ORDER BY \"Id\" DESC LIMIT 1";
				PreparedStatement ps3 = con.prepareStatement(query);
				ResultSet rs = ps3.executeQuery();
				
				int pid = 0; // Initialize pid variabl
				if (rs.next()) {
					pid = rs.getInt("Id"); // Extract the latest ID into pid
				}
				
				String insertQuery = "INSERT INTO appointment_table (\"DoctorId\", \"PatientId\") VALUES (?,?)";
				try (PreparedStatement ps1 = con.prepareStatement(insertQuery)) {
					
					ps1.setString(1, did);
					ps1.setInt(2, pid); // Now pid is defined and used correctly
					int res1 = ps1.executeUpdate();
					
					if(res1 > 0) {
						
						session.setAttribute("patientNameSession", name );
						session.setAttribute("patientAgeSession", age );
						session.setAttribute("patientGenderSession", gender );
						session.setAttribute("patientPhoneSession", phone );
						
						session.setAttribute("doctorSessionName", dname);
						session.setAttribute("doctorSessionSpec", dspec);
						session.setAttribute("doctorSessionPhone", dphone);
						
						RequestDispatcher rd = request.getRequestDispatcher("AppointmentReceipt.jsp");
						rd.forward(request, response);
					}
				}
			}
			
					
		} catch (Exception e) {
			e.printStackTrace(); 
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
}