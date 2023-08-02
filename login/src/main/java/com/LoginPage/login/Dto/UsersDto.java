package com.LoginPage.login.Dto;



public class UsersDto {
	
	


	private int userId;
	private String userName;
	private String emailId;
	private String password;
	private String details;
	
	
	public UsersDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public UsersDto(int userId, String userName, String emailId, String password, String details) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.emailId = emailId;
		this.password = password;
		this.details = details;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	@Override
	public String toString() {
		return "UsersDto [userId=" + userId + ", userName=" + userName + ", emailId=" + emailId + ", password="
				+ password + ", details=" + details + "]";
	}
	
	

}
