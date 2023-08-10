package com.LoginPage.login.Entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;



@Entity
@Table(name = "UsersDetails  ")
public class UserDetails {

	@Id
	@Column(name="UserId")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int userId;
	@Column(name="UserName")
	private String userName;
	@Column(name="User_Address")
	private String userAddress;
	@Column(name="Payment_Option")
	private String paymentOption;
	
	@OneToMany(targetEntity = Bill.class, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Bill> bills;

	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDetails(int userId, String userName, String userAddress, String paymentOption, List<Bill> bills) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userAddress = userAddress;
		this.paymentOption = paymentOption;
		this.bills = bills;
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

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public List<Bill> getBills() {
		return bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	@Override
	public String toString() {
		return "UserDetails [userId=" + userId + ", userName=" + userName + ", userAddress=" + userAddress
				+ ", paymentOption=" + paymentOption + ", bills=" + bills + "]";
	}
	
	
	
	
}
