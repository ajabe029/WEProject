package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.*;

public class IssuesServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		IssuesDAO issuesDao= new IssuesDAO();
	    List<Issues> issues = null;
		try {
			issues = issuesDao.getIssues();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    request.setAttribute("issues", issues);
	    request.getRequestDispatcher("welcome-admin.jsp").forward(request, response);
	}
}
