package com.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.db.*;

public class RecipesDAO {
	
    private Connection connection;
    private Statement statement;
 
    public RecipesDAO() { }
    
    /**
     * 
     * @param userId 
     * @return List of recipes for a particular user
     * @throws SQLException
     */
    public List<Recipes> getRecipes(int userId) throws SQLException {
    	PreparedStatement query = null;
        String queryString = ("SELECT recipes.recipe_id, name, description, preptime, cooktime, datecreated, dateupdated FROM irecipe.recipes \n"
        		+ "LEFT JOIN user_recipes ON recipes.recipe_id = user_recipes.recipe_id \n"
        		+ "WHERE user_id = ?");
        ResultSet rs = null;
        List<Recipes> recipes = new ArrayList<Recipes>();
        try {
            connection = ConnectionFactory.getConnection();
            query = connection.prepareStatement(queryString);
            System.out.println(queryString);
            query.setInt(1, userId);
            rs = query.executeQuery();
            while(rs.next()){
            	Recipes recipe = new Recipes();
            	recipe.setRecipeID(rs.getInt("recipe_id"));
            	recipe.setName(rs.getString("name"));
            	recipe.setDescription(rs.getString("description"));
            	recipe.setPreptime(rs.getString("preptime"));
            	recipe.setCooktime(rs.getString("cooktime"));
            	recipe.setDatecreated(rs.getDate("datecreated"));
            	recipe.setDateupdated(rs.getDate("dateupdated"));
            	recipes.add(recipe);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(connection);
        }
        return recipes;
    }

    /**
     * 
     * @return List of ALL recipes in the DB
     * @throws SQLException
     */
	public List<Recipes> list() throws SQLException {
        StringBuffer query = new StringBuffer();
        query.append("SELECT * FROM recipes \n");
        ResultSet rs = null;
        List<Recipes> recipes = new ArrayList<Recipes>();
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query.toString());
            while(rs.next()){
            	Recipes recipe = new Recipes();
            	recipe.setRecipeID(rs.getInt("recipe_id"));
            	recipe.setName(rs.getString("name"));
            	recipe.setDescription(rs.getString("description"));
            	recipe.setPreptime(rs.getString("preptime"));
            	recipe.setCooktime(rs.getString("cooktime"));
            	recipe.setDatecreated(rs.getDate("datecreated"));
            	recipe.setDateupdated(rs.getDate("dateupdated"));
            	recipes.add(recipe);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(connection);
        }
        return recipes;
	}
	
	/**
	 * 
	 * @param recipeId
	 * @return A particular recipe
	 * @throws SQLException
	 */
	public List<Recipes> getRecipe(int recipeId) throws SQLException {
		
		PreparedStatement query = null;
        String queryString = ("SELECT * FROM recipes where recipe_id = ?");
        List<Recipes> recipe = new ArrayList<Recipes>();
        ResultSet rs = null;
        try {
            connection = ConnectionFactory.getConnection();
            query = connection.prepareStatement(queryString);
            query.setInt(1, recipeId);
            System.out.println(queryString);
            rs = query.executeQuery();
            
            while(rs.next()){
            	Recipes temp = new Recipes();
            	temp.setRecipeID(rs.getInt("recipe_id"));
            	temp.setName(rs.getString("name"));
            	temp.setDescription(rs.getString("description"));
            	temp.setPreptime(rs.getString("preptime"));
            	temp.setCooktime(rs.getString("cooktime"));
            	temp.setDatecreated(rs.getDate("datecreated"));
            	temp.setDateupdated(rs.getDate("dateupdated"));
            	recipe.add(temp);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(connection);
        }
        return recipe;
	}
	 
	public List<Steps> getRecipeSteps(int recipeId) throws SQLException{
		PreparedStatement query = null;
		String queryString = ("SELECT * FROM steps WHERE recipe_id = ?");
		List<Steps> steps = new ArrayList<Steps>();
		ResultSet rs = null;
		try{
			connection = ConnectionFactory.getConnection();
            query = connection.prepareStatement(queryString);
            query.setInt(1, recipeId);
            System.out.println(queryString);
            rs = query.executeQuery();
            
            while(rs.next()){
            	Steps step = new Steps();
            	step.setRecipeID(rs.getInt("recipe_Id"));
            	step.setStep_index(rs.getInt("step_index"));
            	step.setSteptext(rs.getString("steptext"));
            	steps.add(step);
            }
		} finally {
			DbUtil.close(rs);
            DbUtil.close(connection);
		}
		return steps;
	}
	
	public List<Ingredients> getRecipeIngredients(int recipeId) throws SQLException {
		
		PreparedStatement query = null;
        String queryString = ("SELECT recipe_id, name, amount_required,units FROM recipe_ingredients \n"
        		+ "LEFT JOIN ingredients ON recipe_ingredients.ingredient_id = ingredients.ingredient_id \n"
        		+ "WHERE recipe_id = ?");
        List<Ingredients> ingredients = new ArrayList<Ingredients>();
        ResultSet rs = null;
        try {
            connection = ConnectionFactory.getConnection();
            query = connection.prepareStatement(queryString);
            query.setInt(1, recipeId);
            System.out.println(queryString);
            rs = query.executeQuery();
            
            while(rs.next()){
            	Ingredients temp = new Ingredients();
            	temp.setRecipeID(rs.getInt("recipe_id"));
            	temp.setIngredientName(rs.getString("name"));
            	temp.setAmountRequired(rs.getInt("amount_required"));
            	temp.setUnits(rs.getString("units"));
            	ingredients.add(temp);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(connection);
        }
        return ingredients;
	}
}
