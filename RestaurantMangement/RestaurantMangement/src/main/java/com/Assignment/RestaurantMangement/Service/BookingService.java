package com.Assignment.RestaurantMangement.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Booking;


@Service
public interface BookingService {
	
	public void bookTable(String tableNumber, LocalDateTime reservationTime, String bookingId);
	
	public void updateBooking(String bookingId, String newTableNumber, LocalDateTime reservationTime);
	
	public void deleteBooking(String tableNumber, String bookingId);
	
	public List<Booking> getAllBookings();

}
