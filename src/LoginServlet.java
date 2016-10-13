import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String username = request.getParameter("loginUsername");  
		String password = request.getParameter("loginPassword"); 
		
		HttpSession session = request.getSession(false);
		if(session!=null)
		session.setAttribute("username", username);
		session.setAttribute("language", "EN");

		if(DBFront.validate(username, password)){  
			response.sendRedirect("welcome.jsp");
		}  
		else{  
			request.setAttribute("errorMessage", "Invalid user or password");  
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");  
			rd.forward(request,response);  
		}  

		out.close();  
	}  
}  