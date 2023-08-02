package com.Assignment.RestaurantMangement.Entities;



import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;



@Document(collection="Cuisines")
public class Cuisines {

	@Id
	private String id;
	@Field("Cuisine Name")
    private String name;
	
	
	
	
	public Cuisines() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Cuisines(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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



	@Override
	public String toString() {
		return "Cuisines [id=" + id + ", name=" + name + "]";
	}
	
	
	
	
}
