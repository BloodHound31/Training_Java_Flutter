package com.Assignment.RestaurantMangement.Entities;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "menuItems")
public class MenuItems {

	@Id
	private String id;
	@Field("Item Name")
	private String name;
	@Field("Item Price")
	private double price;
	
	@DBRef
	private Categories categories;
	
	@DBRef
	private Cuisines cuisines;
	
	
	public MenuItems() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MenuItems(String id, String name, double price, Categories categories, Cuisines cuisines) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.categories = categories;
		this.cuisines = cuisines;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public Categories getCategories() {
		return categories;
	}


	public void setCategories(Categories categories) {
		this.categories = categories;
	}


	public Cuisines getCuisines() {
		return cuisines;
	}


	public void setCuisines(Cuisines cuisines) {
		this.cuisines = cuisines;
	}


	@Override
	public String toString() {
		return "MenuItems [id=" + id + ", name=" + name + ", price=" + price + ", categories=" + categories
				+ ", cuisines=" + cuisines + "]";
	}

	
	


	
	
	
	

}
