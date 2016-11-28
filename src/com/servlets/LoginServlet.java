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
import com.common.*;

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String username = request.getParameter("loginUsername");  
		String password = request.getParameter("loginPassword");
		int userType = DBFront.getUserType(username, password);
		int userId = DBFront.getUserId(username);

		HttpSession session = request.getSession(false);
		
		if(DBFront.validate(username, password)){
			if(session!=null)
			session.setAttribute("username", username);
			session.setAttribute("language", "EN");
			session.setAttribute("user_id", userId);
			if(userType == CommonConstants.ADMIN){
				response.sendRedirect("welcome-admin");
			}else{
				response.sendRedirect("welcome.jsp");
			}
		}  
		else{  
			request.setAttribute("errorMessage", "Invalid user or password");
			session.setAttribute("logoutMessage", "");
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");  
			rd.forward(request,response);  
		}  

		out.close();  
	}  }  