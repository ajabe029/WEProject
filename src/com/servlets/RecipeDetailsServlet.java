package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.*;

public class RecipeDetailsServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecipesDAO recipesDao = new RecipesDAO();
		List<Recipes> recipe = null;
		int recipeId = Integer.parseInt(request.getParameter("recipe_id"));
		//System.out.println(recipeId);
		
		try{
			recipe = recipesDao.getRecipe(recipeId);
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("recipeDetails", recipe);
		request.getRequestDispatcher("recipe.jsp").forward(request, response);
	}

}
