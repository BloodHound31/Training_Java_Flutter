package com.LoginPage.login.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="ProductDetails")
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
	
	
	public ProductDetails() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ProductDetails(int id, int availableStock, String sellerName, double sellingPrice, double costPrice) {
		super();
		this.id = id;
		this.availableStock = availableStock;
		this.sellerName = sellerName;
		this.sellingPrice = sellingPrice;
		this.costPrice = costPrice;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getAvailableStock() {
		return availableStock;
	}


	public void setAvailableStock(int availableStock) {
		this.availableStock = availableStock;
	}


	public String getSellerName() {
		return sellerName;
	}


	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}


	public double getSellingPrice() {
		return sellingPrice;
	}


	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}


	public double getCostPrice() {
		return costPrice;
	}


	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}


	@Override
	public String toString() {
		return "ProductDetails [id=" + id + ", availableStock=" + availableStock + ", sellerName=" + sellerName
				+ ", sellingPrice=" + sellingPrice + ", costPrice=" + costPrice + "]";
	}
	
	
	

}
