package com.LoginPage.login.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;




@Entity
@Table(name = "Users")
public class Users {
	
	@Id
	@Column(name="UserId")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int userId;
	@Column(name="UserName")
	private String userName;
	@Column(name="EmailId")
	private String emailId;
	@Column(name="Password")
	private String password;
	@Column(name="Details")
	private String details;
	
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Users(int userId, String userName, String emailId, String password, String details) {
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
		return "Users [userId=" + userId + ", userName=" + userName + ", emailId=" + emailId + ", password=" + password
				+ ", details=" + details + "]";
	}
	
	
	
	
	
	
	

}
