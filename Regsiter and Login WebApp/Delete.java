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
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String deleteUser = request.getParameter("deleteEmail");
		
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://aws-0-ap-northeast-2.pooler.supabase.com:5432/postgres?user=postgres.nwgggsqdywxyhyquiuem&password=gGAObT01VRA8MQ14";
			Connection con = DriverManager.getConnection(url);
			
			PreparedStatement ps = con.prepareStatement("delete from register where \"Email\"=?");
			
			ps.setString(1, deleteUser);
			
			int res = ps.executeUpdate();
			
			if(res>0) {
				response.setContentType("text/html");
				out.print("<h2 style='color:green'>Account Deleted</h2>");
				RequestDispatcher rd = request.getRequestDispatcher("index.html");
				rd.include(request, response);
			}
				
		} catch(Exception e) {
			response.setContentType("text/html");
			out.print("<h2 style='color:red'>Error !</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
			rd.include(request, response);
			
		}
	}

}
