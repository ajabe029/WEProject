package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.db.DBFront;
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		int userId = (int) session.getAttribute("user_id");
		
		InventoryDAO inventoryDao = new InventoryDAO();
		List<Inventory> inventory = null;
		
		try{
			inventory = inventoryDao.getUserInventory(userId);
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("inventory", inventory);
		request.getRequestDispatcher("myinventory.jsp").forward(request, response);
	}
}
