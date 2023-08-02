package com.Assignment.RestaurantMangement.Entities;

import java.time.LocalDateTime;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("Bookings")
public class Booking {

	@Id
	private String bookingId;
	private String tableNumber;
	private String bookingType;
	private LocalDateTime bookingTime;
	
	
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Booking(String bookingId, String tableNumber, String bookingType, LocalDateTime bookingTime) {
		super();
		this.bookingId = bookingId;
		this.tableNumber = tableNumber;
		this.bookingType = bookingType;
		this.bookingTime = bookingTime;
	}


	public String getBookingId() {
		return bookingId;
	}


	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}


	public String getTableNumber() {
		return tableNumber;
	}


	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}


	public String getBookingType() {
		return bookingType;
	}


	public void setBookingType(String bookingType) {
		this.bookingType = bookingType;
	}


	public LocalDateTime getBookingTime() {
		return bookingTime;
	}


	public void setBookingTime(LocalDateTime bookingTime) {
		this.bookingTime = bookingTime;
	}


	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", tableNumber=" + tableNumber + ", bookingType=" + bookingType
				+ ", bookingTime=" + bookingTime + "]";
	}
	
	
	
	
}
