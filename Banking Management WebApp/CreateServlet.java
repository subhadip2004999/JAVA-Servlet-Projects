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

/**
 * Servlet implementation class CreateServlet
 */
@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	
    	session.removeAttribute("SessionStatus");
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
		
		String accountnumber = request.getParameter("accountnumber1");
		String accounttype = request.getParameter("accounttype1");
		String name = request.getParameter("name1");
		String phone = request.getParameter("phone1");
		String email = request.getParameter("email1");
		
		String status = "Account Created Successfully";
		String failed = "Failed to Create account";
		
		String query = "INSERT INTO bank (AccountNumber, AccountType, Name, Phone, Email) VALUES (?,?,?,?,?)";
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, accountnumber);
            ps.setString(2, accounttype);
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, email);
            int res = ps.executeUpdate();
            if (res>0){
                
            	session.setAttribute("SessionStatus", status);
            	
            	response.sendRedirect("Home.jsp");
            }
            else {
    			session.removeAttribute("SessionStatus");
    			response.sendRedirect("Home.jsp");
            }
			
		} catch (Exception e) {
			session.setAttribute("SessionStatusFailed", failed);
        	RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        	rd.forward(request, response);
			
			e.printStackTrace();
		}
	}

}
