package myPackage;

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
 * Servlet implementation class BalanceServlet
 */
@WebServlet("/BalanceServlet")
public class BalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BalanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	
    	session.removeAttribute("SessionCurrentBalance");
		session.removeAttribute("SessionAcNo");
    	response.sendRedirect("Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12836170?useSSL=false&allowPublicKeyRetrieval=true";
		String username = "sql12836170";
		String password = "w6y825TXUN";
		
		HttpSession session = request.getSession();
		
		String accountnumber = request.getParameter("accountnumber5");
		
		String query = "SELECT Balance FROM bank WHERE AccountNumber = ?";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, accountnumber);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				session.setAttribute("SessionCurrentBalance", rs.getDouble("Balance"));
				session.setAttribute("SessionAcNo", accountnumber);
				response.sendRedirect("Home.jsp");
			}
			else {
				session.removeAttribute("SessionCurrentBalance");
				session.removeAttribute("SessionAcNo");
				
				response.sendRedirect("Home.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.removeAttribute("SessionCurrentBalance");
			session.removeAttribute("SessionAcNo");
		
			response.sendRedirect("Home.jsp");
		}
		
	}

}
