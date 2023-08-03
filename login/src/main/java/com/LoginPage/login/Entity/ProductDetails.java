package com.LoginPage.login.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

//@Entity
//@Table(name="ProductDetails")
public class ProductDetails {
	
	@Id
	@Column(name="ProductId")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name="Available Stock")
	private int availableStock;
	@Column(name="Retailer Information")
	private String sellerName;
	@Column(name="sellingPrice")
	private double sellingPrice;
	@Column(name="costPrice")
	private double costPrice;
	

}
