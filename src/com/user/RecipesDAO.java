package com.user;
import java.sql.Connection;
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
            	recipe.setInstructions(rs.getString("instructions"));
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

	public static List<Recipes> list() {
		// TODO Auto-generated method stub
		return null;
	}
}
