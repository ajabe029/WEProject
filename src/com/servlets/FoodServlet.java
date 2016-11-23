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

public class FoodServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		String username = session.getAttribute("username").toString();
		
		String[] ingredients = request.getParameterValues("ingredients");
		String[] ingredientsQuantities = request.getParameterValues("ingredientQuantities");
		String[] ingredientsQUnits = request.getParameterValues("ingredientsQUnits");

		if(DBFront.addFood(username, ingredients, ingredientsQuantities, ingredientsQUnits) > 0){  
			request.setAttribute("recipeSuccessMessage", "Food added successfully to inventory");
			RequestDispatcher rd=request.getRequestDispatcher("myinventory.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			request.setAttribute("recipeErrorMessage", "Error adding food to inventory");  
			RequestDispatcher rd=request.getRequestDispatcher("myinventory.jsp");  
			rd.forward(request,response);  
		}  

		out.close();  
	} 
}
