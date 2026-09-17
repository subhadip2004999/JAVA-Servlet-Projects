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
 * Servlet implementation class DepositServlet
 */
@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	
    	session.removeAttribute("SessionAmount");
    	session.removeAttribute("SessionDeposited");
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
		
		String accountnumber = request.getParameter("accountnumber3");
		String depositamountStr = request.getParameter("depositamount3");
		
		String status = "Successfully Deposited to your Account: " + accountnumber;
		
		double depositamount = Double.parseDouble(depositamountStr);
		
		String query1 = "SELECT Balance FROM bank WHERE AccountNumber = ?";
        String query2 = "UPDATE bank SET Balance = ? WHERE AccountNumber = ?";
        
        try {
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, accountnumber); 
            
            ResultSet rs = ps1.executeQuery();
            
            if (rs.next()) {
                double currentbalance = rs.getDouble("Balance");
                double newbalance = currentbalance + depositamount;

                PreparedStatement ps2 = con.prepareStatement(query2);
                ps2.setDouble(1, newbalance);
                ps2.setString(2, accountnumber);
                
                int result = ps2.executeUpdate();
                
                if(result>0) {
                	session.setAttribute("SessionAmount", depositamount);
                	session.setAttribute("SessionDeposited", status);
                	
                	response.sendRedirect("Home.jsp");
                	
                }
                
                else {
                	session.removeAttribute("SessionAmount");
                	session.removeAttribute("SessionDeposited");
                	RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                	rd.forward(request, response);
                }
                
            }
            else {
            	session.removeAttribute("SessionAmount");
            	session.removeAttribute("SessionDeposited");
            	RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            	rd.forward(request, response);
            }
        	
        } catch (Exception e) {
        	e.printStackTrace();
        	RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        	rd.forward(request, response);
        }

		
    }
}

