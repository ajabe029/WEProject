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

public class RecipeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		
		String recName = request.getParameter("recName");
		String recDescription = request.getParameter("recDescription");
		String recCookTime = request.getParameter("recCooktime");
		String recPrepTime = request.getParameter("recPreptime");
		String recInstructions = request.getParameter("recPreptime");
		
		HttpSession session = request.getSession(false);
		String username = session.getAttribute("username").toString();
		
		String[] ingredients = request.getParameterValues("ingredients");
		String[] ingredientsQuantities = request.getParameterValues("ingredientQuantities");
		String[] ingredientsQUnits = request.getParameterValues("ingredientsQUnits");

		if(DBFront.addRecipe(username, recName, recDescription, recCookTime, recPrepTime, recInstructions, ingredients, ingredientsQuantities, ingredientsQUnits) > 0){  
			request.setAttribute("recipeSuccessMessage", "Recipe added successfully");
			RequestDispatcher rd=request.getRequestDispatcher("myrecipes.jsp");  
			rd.forward(request,response);  
		}  
		else{  
			request.setAttribute("recipeErrorMessage", "Error adding recipe");  
			RequestDispatcher rd=request.getRequestDispatcher("myrecipes.jsp");  
			rd.forward(request,response);  
		}  

		out.close();  
	} 
}
