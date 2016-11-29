package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.db.ConnectionFactory;
import com.jdbc.db.DbUtil;

public class InventoryDAO {

    private Connection connection;
 
    public InventoryDAO() { }
    
    /**
     * 
     * @param userId 
     * @return List of inventory for a particular user
     * @throws SQLException
     */
    public List<Inventory> getUserInventory(int userId) throws SQLException {
    	PreparedStatement query = null;
        String queryString = ("SELECT user_id,name,quantity,units FROM irecipe.user_ingredients \n"
        		+ "LEFT JOIN ingredients ON user_ingredients.ingredient_id = ingredients.ingredient_id \n"
        		+ "WHERE user_id = ?");
        ResultSet rs = null;
        List<Inventory> inventories = new ArrayList<Inventory>();
        try {
            connection = ConnectionFactory.getConnection();
            query = connection.prepareStatement(queryString);
            System.out.println(queryString);
            query.setInt(1, userId);
            rs = query.executeQuery();
            while(rs.next()){
            	Inventory inventory = new Inventory();
            	inventory.setUserId(rs.getInt("user_id"));
            	inventory.setIngredient(rs.getString("name"));
            	inventory.setQuantity(rs.getInt("quantity"));
            	inventory.setUnits(rs.getString("units"));
            	inventories.add(inventory);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(connection);
        }
        return inventories;
    }
	
}
