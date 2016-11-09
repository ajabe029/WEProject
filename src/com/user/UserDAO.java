package com.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.user.User;
import com.jdbc.db.*;

public class UserDAO {
	
    private Connection connection;
    private Statement statement;
 
    public UserDAO() { }
     
    public User getUser(int userId) throws SQLException {
        String query = "SELECT * FROM users WHERE user_id = " + userId;
        ResultSet rs = null;
        User user = new User();
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            while(rs.next()){
            	user.setUsername(rs.getString("username"));
            	user.setFirstName(rs.getString("firstname"));
            	user.setLastName(rs.getString("lastname"));
            	user.setPassword(rs.getString("password"));
            	user.setEmail(rs.getString("email"));
            	user.setStatus(rs.getString("status"));
            	user.setUserType(rs.getInt("user_type"));
            	user.setCreated(rs.getDate("datecreated"));
            	user.setUpdated(rs.getDate("dateupdated"));
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
            DbUtil.close(connection);
        }
        return user;
    }
}
