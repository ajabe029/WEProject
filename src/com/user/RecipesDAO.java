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
     * @return List of recipes for a particular user
     * @throws SQLException
     */
    public List<Recipes> getRecipes() throws SQLException {
        StringBuffer query = new StringBuffer();
        query.append("SELECT * FROM recipes \n");
        //.append("LEFT JOIN users ON issues.user_id = users.user_id");
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
            	recipe.setPreptime(rs.getInt("preptime"));
            	recipe.setCooktime(rs.getInt("cooktime"));
            	recipe.setDatecreated(rs.getDate("datecreated"));
            	recipe.setDateupdated(rs.getDate("dateupdated"));
            	recipes.add(recipe);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
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
            	recipe.setPreptime(rs.getInt("preptime"));
            	recipe.setCooktime(rs.getInt("cooktime"));
            	recipe.setDatecreated(rs.getDate("datecreated"));
            	recipe.setDateupdated(rs.getDate("dateupdated"));
            	recipes.add(recipe);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
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
            	temp.setPreptime(rs.getInt("preptime"));
            	temp.setCooktime(rs.getInt("cooktime"));
            	temp.setDatecreated(rs.getDate("datecreated"));
            	temp.setDateupdated(rs.getDate("dateupdated"));
            	recipe.add(temp);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
            DbUtil.close(connection);
        }
        return recipe;
	}
}
