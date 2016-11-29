package com.user;

public class Inventory {

	private int userId;
	private String ingredient;
	private int quantity;
	private String units;
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getIngredient() {
		return ingredient;
	}
	
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getUnits() {
		return units;
	}
	
	public void setUnits(String units) {
		this.units = units;
	}	
}
