package com.Assignment.RestaurantMangement.Entities;



import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;




@Document(collection="restaurantData")
public class Restaurant {
	
	
	@Id
	private String id;
	@Field("Restaurant Name")
	private String restaurantName;
	@Field("Total Tables")
	private int totalTables;
	
	
	
	
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}




	public Restaurant(String id, String restaurantName, int totalTables) {
		super();
		this.id = id;
		this.restaurantName = restaurantName;
		this.totalTables = totalTables;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getRestaurantName() {
		return restaurantName;
	}




	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}




	public int getTotalTables() {
		return totalTables;
	}




	public void setTotalTables(int totalTables) {
		this.totalTables = totalTables;
	}




	@Override
	public String toString() {
		return "Restaurant [id=" + id + ", restaurantName=" + restaurantName + ", totalTables=" + totalTables + "]";
	}
	
	
	

}
