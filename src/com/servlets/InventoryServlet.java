package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.Inventory;
import com.user.InventoryDAO;

public class InventoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
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