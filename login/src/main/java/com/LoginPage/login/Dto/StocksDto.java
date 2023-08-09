package com.LoginPage.login.Dto;

public class StocksDto {
	
	private String productName;
	private int availableStocks;
	
	
	public StocksDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public StocksDto(String productName, int availableStocks) {
		super();
		this.productName = productName;
		this.availableStocks = availableStocks;
	}



	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getAvailableStocks() {
		return availableStocks;
	}


	public void setAvailableStocks(int availableStocks) {
		this.availableStocks = availableStocks;
	}



	@Override
	public String toString() {
		return "StocksDto [productName=" + productName + ", availableStocks=" + availableStocks + "]";
	}
	
	
	

}
