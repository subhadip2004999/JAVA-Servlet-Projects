package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginEmail = request.getParameter("email2");
		String loginPassword = request.getParameter("password2");
		
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://aws-0-ap-northeast-2.pooler.supabase.com:5432/postgres?user=postgres.nwgggsqdywxyhyquiuem&password=gGAObT01VRA8MQ14";
			Connection con = DriverManager.getConnection(url);
			
			PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE \"Email\"=? AND \"Password\"=?");
			
			ps.setString(1, loginEmail);
			ps.setString(2, loginPassword);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				HttpSession session = request.getSession();
				session.setAttribute("sName", rs.getString("Name"));
				session.setAttribute("sEmail", rs.getString("Email"));
				session.setAttribute("sGender", rs.getString("Gender"));
				session.setAttribute("sMobile", rs.getString("Mobile"));
				session.setAttribute("sCity", rs.getString("City"));
				
				RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
				rd.include(request, response);
			}
			
			else {
				response.setContentType("text/html");
				out.print("<h2 style='color:red'>Wrong Credentials</h2>");
				RequestDispatcher rd = request.getRequestDispatcher("indexLogin.jsp");
				rd.include(request, response);
			}
			
			
			
		} catch(Exception e) {
			response.setContentType("text/html");
			out.print("<h2 style='color:red'>Try Again</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("indexLogin.jsp");
			rd.include(request,response);
			
		}
		
	}

}
