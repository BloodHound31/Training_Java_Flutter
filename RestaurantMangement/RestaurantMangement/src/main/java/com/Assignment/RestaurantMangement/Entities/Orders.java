package com.Assignment.RestaurantMangement.Entities;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;


@Document(collection="order")
public class Orders {

	@Id
	private String orderId;
	@Field("TableNumber")
	private String tableNumber;
	
	@DBRef
	@Field("Ordered Dishes")
	private List<MenuItems> menuItems;
	
	
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Orders(String orderId, String tableNumber, List<MenuItems> menuItems) {
		super();
		this.orderId = orderId;
		this.tableNumber = tableNumber;
		this.menuItems = menuItems;
	}


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public String getTableNumber() {
		return tableNumber;
	}


	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}


	public List<MenuItems> getMenuItems() {
		return menuItems;
	}


	public void setMenuItems(List<MenuItems> menuItems) {
		this.menuItems = menuItems;
	}


	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", tableNumber=" + tableNumber + ", menuItems=" + menuItems + "]";
	}
	
	
	
	
}
