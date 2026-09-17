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
 * Servlet implementation class DoctorChoice
 */
@WebServlet("/DoctorChoice")
public class DoctorChoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorChoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String ID = request.getParameter("doctorid");
		HttpSession session = request.getSession();
		
		try { 
			Class.forName("org.postgresql.Driver");
			String URL = "url";
			
			try (Connection con = DriverManager.getConnection(URL)) {
						// 2. Fixed SELECT query with the missing parameter assignment
						String selectQuery = "SELECT * FROM doctor_table WHERE \"DId\" = ?";
						try (PreparedStatement ps2 = con.prepareStatement(selectQuery)) {
							ps2.setString(1, ID);
							
							try (ResultSet rs = ps2.executeQuery()) {
								if (rs.next()) {
									String docId = rs.getString("DId");
							        String docName = rs.getString("Name"); 
							        String docSpec = rs.getString("Specialization");	
							        String docPhone = rs.getString("Phone");
							        
							        session.setAttribute("doctorNameSession", docName);
							        session.setAttribute("doctorSpecSession", docSpec);
							        session.setAttribute("doctorPhoneSession", docPhone);
							        session.setAttribute("doctorIdSession", docId);
								}
							}
						}
						
						// 3. Forward to JSP properly
						RequestDispatcher rd = request.getRequestDispatcher("PatientDetails.jsp");
						rd.forward(request, response);
					}
				
			
			
		} catch (Exception e) {
			// This prints the actual error in your console so you can debug it next time
			e.printStackTrace(); 
			response.getWriter().println("Error: " + e.getMessage());
		}
	}

}
