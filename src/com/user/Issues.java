package com.user;

import java.sql.Date;

public class Issues {

	private int issueId;
	private String issueName;
	private String category;
	private String description;
	private String user;
	private int statusId;
	private Date dateCreated;
	private Date dateCompleted;
	
	public int getIssueId() {
		return issueId;
	}
	
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	
	public String getIssueName() {
		return issueName;
	}
	
	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	public int getStatusId() {
		return statusId;
	}
	
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	
	public Date getDateCreated() {
		return dateCreated;
	}
	
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public Date getDateCompleted() {
		return dateCompleted;
	}
	
	public void setDateCompleted(Date dateCompleted) {
		this.dateCompleted = dateCompleted;
	}
}
