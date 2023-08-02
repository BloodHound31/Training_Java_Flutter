package com.Assignment.RestaurantMangement.Entities;


import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;



@Document(collection = "restaurantTable")
public class Tables {
	
	
	@Id
	private String tableNumber;
	@Field("Is Reserved")
	private Boolean isReserved;
	@Field("Number Of People")
	private int tableCapacity;
	@Field("Booking Time")
	private LocalDateTime reservationTime;
	
	@Field("Restaurant")
	@DBRef
	private Restaurant restaurant;
	
	public Tables() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tables(String tableNumber, Boolean isReserved, int tableCapacity, LocalDateTime reservationTime,
			Restaurant restaurant) {
		super();
		this.tableNumber = tableNumber;
		this.isReserved = isReserved;
		this.tableCapacity = tableCapacity;
		this.reservationTime = reservationTime;
		this.restaurant = restaurant;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public Boolean getIsReserved() {
		return isReserved;
	}

	public void setIsReserved(Boolean isReserved) {
		this.isReserved = isReserved;
	}

	public int getTableCapacity() {
		return tableCapacity;
	}

	public void setTableCapacity(int tableCapacity) {
		this.tableCapacity = tableCapacity;
	}

	public LocalDateTime getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(LocalDateTime reservationTime) {
		this.reservationTime = reservationTime;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	@Override
	public String toString() {
		return "Tables [tableNumber=" + tableNumber + ", isReserved=" + isReserved + ", tableCapacity=" + tableCapacity
				+ ", reservationTime=" + reservationTime + ", restaurant=" + restaurant + "]";
	}


	
	
	
	


   
	
	

}
