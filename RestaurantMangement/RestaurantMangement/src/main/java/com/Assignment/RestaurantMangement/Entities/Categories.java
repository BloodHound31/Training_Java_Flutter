package com.Assignment.RestaurantMangement.Entities;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;



@Document(collection="Categories")
public class Categories {
	
	@Id
	//@Field("Category Id")
    private String id;
	@Field("Category Name")
    private String name;
	
	
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Categories(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	public String getId() {
		return id;
	}


	public void setId(String categoriesId) {
		this.id = categoriesId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "Categories [categoriesId=" + id + ", name=" + name + "]";
	}
	
	

}
