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

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usrName = request.getParameter("name1");
		String usrEmail = request.getParameter("email1");
		String usrPhone = request.getParameter("phone1");
		String usrBlood = request.getParameter("blood1");
		String usrCity = request.getParameter("city1");
		String usrPassword = request.getParameter("password1");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			
			Class.forName("org.postgresql.Driver");
			
			String URL = "url";
			
			Connection con = DriverManager.getConnection(URL);
			
			String query = "INSERT INTO donor_table(\"Email\", \"Name\", \"Phone\", \"BloodGroup\", \"City\", \"Password\") Values(?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, usrEmail);
			ps.setString(2, usrName);
			ps.setString(3, usrPhone);
			ps.setString(4, usrBlood);
			ps.setString(5, usrCity);
			ps.setString(6, usrPassword);
			
			int result = ps.executeUpdate();
			
			if(result>0) {
				
				out.print("<h2 style='color:green'>Account Created</h2>");
				RequestDispatcher rd = request.getRequestDispatcher("DonorRegistration.jsp");
				rd.include(request, response);
			}
			
			else {
				out.print("<h2 style='color:red'>Try again</h2>");
				RequestDispatcher rd = request.getRequestDispatcher("DonorRegistration.jsp");
				rd.include(request, response);
			}
			
		} catch (Exception e) {
			out.print("<h2 style='color:red; text-align:center;'>Database Error: " + e.getMessage() + "</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("DonorRegistration.jsp");
			rd.include(request, response);
			
		}
		
		
	}

}
