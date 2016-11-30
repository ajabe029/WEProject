package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.Ingredients;
import com.user.Inventory;
import com.user.InventoryDAO;
import com.user.RecipesDAO;
import com.user.Recipes;

public class InventoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		int userId = (int) session.getAttribute("user_id");
		
		InventoryDAO inventoryDao = new InventoryDAO();
		RecipesDAO recipeDao = new RecipesDAO();
		List<Recipes> matchedRecipes = null;
		List<Recipes> recipes = null;
		List<Inventory> inventory = null;
		List<Ingredients> recipeIngredients = null;
		
		try{
			inventory = inventoryDao.getUserInventory(userId);
			recipes = recipeDao.getRecipes(userId);
			
			int count = 0;
			for(int j = 0; j < recipes.size(); j++){
				recipeIngredients = recipeDao.getRecipeIngredients(recipes.get(j).getRecipeID());
				for(int i = 0; i < inventory.size(); i++){
					count = 0;
					for(int k = 0; k < recipeIngredients.size() || count > (int)(recipeIngredients.size()/2); k++){
						if(inventory.get(i).getIngredient().equals(recipeIngredients.get(k).getIngredientName()) 
							&& inventory.get(i).getQuantity() == recipeIngredients.get(k).getAmountRequired() 
							&& inventory.get(i).getUnits().equals(recipeIngredients.get(k).getUnits())){
							count++;
							matchedRecipes.add(recipeDao.getRecipe(recipes.get(j).getRecipeID()).get(0));
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