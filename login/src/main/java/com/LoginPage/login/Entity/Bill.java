package com.LoginPage.login.Entity;



import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name = "Bills")
public class Bill {
	
	
	@Id
	@Column(name="Bill_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name="Total_MRP")
	private double totalMrp;
	@Column(name="Total Discount")
	private double totalDiscount;
	@Column(name="Total Pay Amount")
	private double payAmount;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "userId")
	private UserDetails userDetails;

	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bill(int id, double totalMrp, double totalDiscount, double payAmount, UserDetails userDetails) {
		super();
		this.id = id;
		this.totalMrp = totalMrp;
		this.totalDiscount = totalDiscount;
		this.payAmount = payAmount;
		this.userDetails = userDetails;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotalMrp() {
		return totalMrp;
	}

	public void setTotalMrp(double totalMrp) {
		this.totalMrp = totalMrp;
	}

	public double getTotalDiscount() {
		return totalDiscount;
	}

	public void setTotalDiscount(double totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	public double getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(double payAmount) {
		this.payAmount = payAmount;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	@Override
	public String toString() {
		return "Bill [id=" + id + ", totalMrp=" + totalMrp + ", totalDiscount=" + totalDiscount + ", payAmount="
				+ payAmount + ", userDetails=" + userDetails + "]";
	}

	
	
}
