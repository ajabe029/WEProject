package com.user;

import java.sql.Date;

public class Recipes {
	
	private int recipeID;
	private String name;
	private String description;
	private int preptime;
	private int cooktime;
	private Date datecreated;
	private Date dateupdated;
	
	public int getRecipeID() {
		return recipeID;
	}
	
	public void setRecipeID(int recipe_id) {
		this.recipeID = recipe_id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getPreptime() {
		return preptime;
	}
	
	public void setPreptime(int preptime) {
		this.preptime = preptime;
	}
	
	public int getCooktime() {
		return cooktime;
	}
	
	public void setCooktime(int cooktime) {
		this.cooktime = cooktime;
	}
	
	public Date getDatecreated() {
		return datecreated;
	}
	
	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	
	public Date getDateupdated() {
		return dateupdated;
	}
	
	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}

}
