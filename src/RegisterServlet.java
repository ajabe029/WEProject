import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String username = request.getParameter("regUsername");  
		String password = request.getParameter("regPassword"); 
		String firstname = request.getParameter("regFirstname");
		String lastname = request.getParameter("regLastname");
		String email = request.getParameter("regEmail");
		String conPassword = request.getParameter("regConfirmPassword");

		if(DBFront.register(firstname, lastname, username, password, email, conPassword) > 0){  
			out.println("<p> Registration Success </p>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			out.print("<p>Error Registering</p>");  
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.include(request,response);  
		}  

		out.close();  
	}  
}  