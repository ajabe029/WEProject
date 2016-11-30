package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.db.DBFront;
import com.user.Ingredients;
import com.user.Inventory;
import com.user.InventoryDAO;
import com.user.Recipes;
import com.user.RecipesDAO;


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
			response.sendRedirect("myinventory");
		}  
		else{  
			request.setAttribute("recipeErrorMessage", "Error adding food to inventory");  
			response.sendRedirect("myinventory");
		}  

		out.close();  
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int userId = 0;
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("user_id") == null){
			response.sendRedirect("index.jsp");
			return;
		}else{
			userId = (int) session.getAttribute("user_id");
		}
		
		InventoryDAO inventoryDao = new InventoryDAO();
		RecipesDAO recipeDao = new RecipesDAO();
		List<Recipes> matchedRecipes = new ArrayList<Recipes>();
		List<Recipes> recipes = null;
		List<Inventory> inventory = null;
		List<Ingredients> recipeIngredients = null;
		
		try{
			inventory = inventoryDao.getUserInventory(userId);
			recipes = recipeDao.getRecipes(userId);
			
			double count = 0;
			for(int j = 0; j < recipes.size(); j++){
				recipeIngredients = recipeDao.getRecipeIngredients(recipes.get(j).getRecipeID());
				count = 0;
				for(int i = 0; i < recipeIngredients.size(); i++){
					for(int k = 0; k < inventory.size(); k++){
						if(inventory.get(k).getIngredient().equals(recipeIngredients.get(i).getIngredientName()) 
								&& inventory.get(k).getQuantity() >= recipeIngredients.get(i).getAmountRequired() 
								&& inventory.get(k).getUnits().equals(recipeIngredients.get(i).getUnits())){
								count++;
						}
						if(count >= (double)recipeIngredients.size()/2){
							matchedRecipes.add(recipeDao.getRecipe(recipes.get(j).getRecipeID()).get(0));
							break;
						}
					}
				}
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("inventory", inventory);
		request.setAttribute("matchedRecipes", matchedRecipes);
		request.getRequestDispatcher("myinventory.jsp").forward(request, response);
	}
}
