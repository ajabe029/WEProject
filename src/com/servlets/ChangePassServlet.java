package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.db.DBFront;

public class ChangePassServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String currentPassword = request.getParameter("currentPassword");  
		String newPassword = request.getParameter("newPassword");

		HttpSession session = request.getSession(false);
		String username = session.getAttribute("username").toString();
		
		int returnValue = DBFront.updatePassword(currentPassword, newPassword, username);
		
		if(returnValue == 1){
			response.sendRedirect("myaccount.jsp");
		}  
		else if(returnValue == -1){  
			request.setAttribute("errorMessage", "Current password does not match.");
			RequestDispatcher rd=request.getRequestDispatcher("/changepassword.jsp");  
			rd.forward(request,response);  
		}  
		else {
			request.setAttribute("errorMessage", "Error updating password.");
			RequestDispatcher rd=request.getRequestDispatcher("/changepassword.jsp");  
			rd.forward(request,response);  
		}

		out.close();  
	} 
}
