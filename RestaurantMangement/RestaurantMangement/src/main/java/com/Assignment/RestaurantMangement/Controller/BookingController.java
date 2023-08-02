package com.Assignment.RestaurantMangement.Controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Assignment.RestaurantMangement.Entities.Booking;
import com.Assignment.RestaurantMangement.Service.BookingService;

@RestController
@RequestMapping("/restaurant/Booking")
public class BookingController {

	@Autowired
	private BookingService bookingService;
	
	@PostMapping("/{bookingId}/")
    public void bookTable(
            @RequestParam(name = "tableNumber") String tableNumber,
            @RequestParam(name = "reservationTime") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")LocalDateTime reservationTime,
            @PathVariable String bookingId) 
	{
        bookingService.bookTable(tableNumber, reservationTime, bookingId);
    }
	
	@DeleteMapping("/{tableNumber}/")
    public void deleteBooking(@PathVariable String tableNumber, @RequestParam(name = "bookingId") String bookingId) {
        bookingService.deleteBooking(tableNumber, bookingId);
    }
	
	@GetMapping("/")
	public List<Booking> getBookings(){
		
		return this.bookingService.getAllBookings();
	}
	
	@PutMapping("/{bookingId}/")
	public void updateBooking(@PathVariable String bookingId, @RequestParam(name = "tableNumber") String newTableNumber, 
			@RequestParam(name = "reservationTime") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")LocalDateTime reservationTime) {
		
		bookingService.updateBooking(bookingId, newTableNumber, reservationTime);
		
	}
	
	
}
