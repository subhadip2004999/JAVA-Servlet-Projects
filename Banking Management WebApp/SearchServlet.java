package myPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	
    	session.removeAttribute("SessionId");
        session.removeAttribute("SessionName");
        session.removeAttribute("SessonAccountNumber");
        session.removeAttribute("SessionAccountType");
        session.removeAttribute("SessionPhone");
        session.removeAttribute("SessionEmail"); 
        session.removeAttribute("SessionKyc"); 
        session.removeAttribute("SessionStatus22");
        
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
		
		String accountnumber = request.getParameter("accountnumber2");
		
		String status = "Customer Found";
		
		String query = "SELECT * FROM bank WHERE AccountNumber = ?";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, accountnumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
                int id = rs.getInt("id");     
                String accounttype = rs.getString("AccountType");
                String name = rs.getString("Name");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String kyc = rs.getString("Kyc");
                
                session.setAttribute("SessionId", id);
                session.setAttribute("SessionName", name);
                session.setAttribute("SessonAccountNumber", accountnumber);
                session.setAttribute("SessionAccountType", accounttype);
                session.setAttribute("SessionPhone", phone);
                session.setAttribute("SessionEmail", email);
                session.setAttribute("SessionKyc", kyc);
                
                session.setAttribute("SessionStatus22", status);
                
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            	rd.forward(request, response);  
            }
			else {
				session.removeAttribute("SessionId");
                session.removeAttribute("SessionName");
                session.removeAttribute("SessonAccountNumber");
                session.removeAttribute("SessionAccountType");
                session.removeAttribute("SessionPhone");
                session.removeAttribute("SessionEmail"); 
                session.removeAttribute("SessionKyc"); 
                session.removeAttribute("SessionStatus22");
                
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            	rd.forward(request, response);
			}
			
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        	rd.forward(request, response);
			e.printStackTrace();
		}
	}

}
