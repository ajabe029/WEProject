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

public class RegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		HttpSession session = request.getSession(false);
		
		String username = request.getParameter("regUsername");  
		String password = request.getParameter("regPassword"); 
		String firstname = request.getParameter("regFirstname");
		String lastname = request.getParameter("regLastname");
		String email = request.getParameter("regEmail");
		String conPassword = request.getParameter("regConfirmPassword");

		if(DBFront.register(firstname, lastname, username, password, email, conPassword) > 0){  
			request.setAttribute("signup", "Your account has been successfully created!");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			request.setAttribute("errorMessage", "Error Registering");
			session.setAttribute("logoutMessage", "");
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");  
			rd.forward(request,response); 
		}  

		out.close();  
	}  
}  