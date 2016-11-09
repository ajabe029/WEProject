package com.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.db.*;

public class IssuesDAO {
	
    private Connection connection;
    private Statement statement;
 
    public IssuesDAO() { }
     
    public List<Issues> getIssues() throws SQLException {
        StringBuffer query = new StringBuffer();
        query.append("SELECT * FROM issues \n")
        .append("LEFT JOIN users ON issues.user_id = users.user_id");
        ResultSet rs = null;
        List<Issues> issues = new ArrayList<Issues>();
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query.toString());
            while(rs.next()){
            	Issues issue = new Issues();
            	issue.setIssueId(rs.getInt("issue_id"));
            	issue.setStatusId(rs.getInt("status"));
            	issue.setIssueName(rs.getString("name"));
            	issue.setDescription(rs.getString("description"));
            	issue.setUser(rs.getString("username"));
            	issue.setCategory(rs.getString("category"));
            	issue.setDateCompleted(rs.getDate("datecompleted"));
            	issue.setDateCreated(rs.getDate("datecreated"));
            	issues.add(issue);
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
            DbUtil.close(connection);
        }
        return issues;
    }

	public static List<Issues> list() {
		// TODO Auto-generated method stub
		return null;
	}
}
