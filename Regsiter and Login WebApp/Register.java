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

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Register() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String usrEmail = request.getParameter("email1");
		String usrName = request.getParameter("name1");
		String usrGender = request.getParameter("gender1");
		String usrMobile = request.getParameter("mobile1");
		String usrPassword = request.getParameter("password1");
		String usrCity = request.getParameter("city1");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://aws-0-ap-northeast-2.pooler.supabase.com:5432/postgres?user=postgres.nwgggsqdywxyhyquiuem&password=gGAObT01VRA8MQ14";
			
			try (Connection con = DriverManager.getConnection(url)) {
				
				String sql = "INSERT INTO register (\"Email\", \"Name\", \"Gender\", \"Mobile\", \"Password\", \"City\") VALUES (?, ?, ?, ?, ?, ?)";
				
				
				try (PreparedStatement ps = con.prepareStatement(sql)) {
					ps.setString(1, usrEmail);
					ps.setString(2, usrName);
					ps.setString(3, usrGender);
					ps.setString(4, usrMobile); // Requires Mobile column in Supabase to be text/varchar
					ps.setString(5, usrPassword);
					ps.setString(6, usrCity);

					int result = ps.executeUpdate();

					if (result > 0) {
						out.print("<h2 style='color:green'>Success</h2>");
						RequestDispatcher rd = request.getRequestDispatcher("indexLogin.jsp");
						rd.include(request, response);
					} else {
						out.print("<h2 style='color:red'>Try Again</h2>");
						RequestDispatcher rd = request.getRequestDispatcher("indexRegister.jsp");
						rd.include(request, response);
					}
				}
			}

		} catch (Exception e) {
			// Print error to Eclipse console
			e.printStackTrace();

			// Display the specific error message on screen
			out.print("<h2 style='color:red'>Database Error: " + e.getMessage() + "</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("indexRegister.jsp");
			rd.include(request, response);
		}
	}
}