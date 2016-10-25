package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.db.*;

public class UpdateServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String firstname = request.getParameter("updateFirstname");  
		String lastname = request.getParameter("updateLastname");
		String email = request.getParameter("updateEmail");  
		String username = request.getParameter("updateUsername"); 
		
		HttpSession session = request.getSession(false);
		String oldUsername = session.getAttribute("username").toString();
		if(session!=null)
		session.setAttribute("username", username);

		if(DBFront.updateInfo(firstname, lastname, email, username, oldUsername) > 0){  
			RequestDispatcher rd=request.getRequestDispatcher("/myaccount.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			request.setAttribute("errorMessage", "Invalid data entered");  
		}  

		out.close();  
	}  
}
