package com.user;

public class Ingredients {
	
	private int recipeID;
	private String ingredientName;
	private int amountRequired;
	private String units;
	
	public int getRecipeID() {
		return recipeID;
	}
	
	public void setRecipeID(int recipeID) {
		this.recipeID = recipeID;
	}
	
	public String getIngredientName() {
		return ingredientName;
	}
	
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	
	public int getAmountRequired() {
		return amountRequired;
	}
	
	public void setAmountRequired(int amountRequired) {
		this.amountRequired = amountRequired;
	}
	
	public String getUnits() {
		return units;
	}
	
	public void setUnits(String units) {
		this.units = units;
	}
	
}
