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
 * Servlet implementation class KycServlet
 */
@WebServlet("/KycServlet")
public class KycServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KycServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		session.removeAttribute("SessionKycAc");
    	session.removeAttribute("SessionKycVerify");
    	
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
		
		String accountnumber = request.getParameter("accountnumber6");
		String phone = request.getParameter("phone6");
		
		String status1 = "KYC Already Verified";
		String status2 = "KYC Verification Done";
		String status3 = "Account/Phone Number not found";
		String status4 = "Failed";
		
		
		String selectQuery = "SELECT Name, Kyc FROM bank WHERE AccountNumber = ? AND Phone = ?";
        String updateQuery = "UPDATE bank SET Kyc = 'Verified' WHERE AccountNumber = ?";
		
        try {
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
        	
            PreparedStatement ps1 = con.prepareStatement(selectQuery);
            ps1.setString(1, accountnumber);
            ps1.setString(2, phone);
            
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                String name = rs.getString("Name");
                String currentKyc = rs.getString("Kyc");

                if ("Verified".equalsIgnoreCase(currentKyc)) {
                    
                	session.setAttribute("SessionKycVerify", status1);
                	session.setAttribute("SessionKycAc", accountnumber);
                	
                	response.sendRedirect("Home.jsp");
                	
                } else {
                    PreparedStatement ps2 = con.prepareStatement(updateQuery);
                    ps2.setString(1, accountnumber);

                    int rowsAffected = ps2.executeUpdate();
                    if (rowsAffected > 0) {
                    	session.setAttribute("SessionKycVerify", status2);
                    	session.setAttribute("SessionKycAc", accountnumber);
                    	
                    	response.sendRedirect("Home.jsp");
                    } else {
                    	
                    	
                    	response.sendRedirect("Home.jsp");
                    }
                }
            } else {
            	session.setAttribute("SessionKycAc", status3);
            	session.setAttribute("SessionKycVerify", status4);
            	
            	response.sendRedirect("Home.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("SessionKycAc", status3);
        	session.setAttribute("SessionKycVerify", status4);
        	
        	response.sendRedirect("Home.jsp");
        }
        
	}

}
