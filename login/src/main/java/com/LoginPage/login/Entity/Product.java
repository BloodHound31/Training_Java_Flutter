package com.LoginPage.login.Entity;



import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "ProductData")
public class Product {
	
	@Id
	@Column(name="ProductId")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int productId;
	@Column(name="ProductName")
	private String productName;
	@Column(name="Product Discription")
	private String productDiscription;
	@Column(name="Product MRP")
	private double productPrice;
	@Column(name="Seller Discount")
	private double sellerDiscount;
	@Column(name="sellerName")
	private String sellerName;
	@Column(name="Product Category")
	private String productCategories;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
    @JoinColumn(name = "product_details_id")
	private ProductDetails productDetails;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productId, String productName, String productDiscription, double productPrice,
			double sellerDiscount, String sellerName, String productCategories, ProductDetails productDetails) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDiscription = productDiscription;
		this.productPrice = productPrice;
		this.sellerDiscount = sellerDiscount;
		this.sellerName = sellerName;
		this.productCategories = productCategories;
		this.productDetails = productDetails;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDiscription() {
		return productDiscription;
	}

	public void setProductDiscription(String productDiscription) {
		this.productDiscription = productDiscription;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public double getSellerDiscount() {
		return sellerDiscount;
	}

	public void setSellerDiscount(double sellerDiscount) {
		this.sellerDiscount = sellerDiscount;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(String productCategories) {
		this.productCategories = productCategories;
	}

	public ProductDetails getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(ProductDetails productDetails) {
		this.productDetails = productDetails;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDiscription="
				+ productDiscription + ", productPrice=" + productPrice + ", sellerDiscount=" + sellerDiscount
				+ ", sellerName=" + sellerName + ", productCategories=" + productCategories + ", productDetails="
				+ productDetails + "]";
	}
	
	

	
	
	
	
	

}
