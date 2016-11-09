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

public class BugServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String bugName = request.getParameter("bugName");
		String bugCategory = request.getParameter("bugCategory");
		String bugDescription = request.getParameter("bugDescription");
		HttpSession session = request.getSession(false);
		String username = session.getAttribute("username").toString();

		if(DBFront.reportBug(bugName, bugCategory, bugDescription, username) > 0){  
			request.setAttribute("bugSuccessMessage", "Issue Reported Successfully");
			RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			request.setAttribute("bugErrorMessage", "Error Reporting Issue");  
			RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp");  
			rd.forward(request,response);  
		}  

		out.close();  
	}  
}  