package com.Assignment.RestaurantMangement.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.BookingDao;
import com.Assignment.RestaurantMangement.Dao.TableDao;
import com.Assignment.RestaurantMangement.Entities.Booking;
import com.Assignment.RestaurantMangement.Entities.Tables;

@Service
public class BookingServiceImpl implements BookingService{

	@Autowired
	private TableDao tableDao;
	
	@Autowired
	private BookingDao bookingDao;
	
	
	@Override
	public void bookTable(String tableNumber, LocalDateTime reservationTime, String bookingId) {
		// TODO Auto-generated method stub
		//Get the table entity by the tablenumber
		Tables table = tableDao.findById(tableNumber) .orElseThrow(() -> new IllegalArgumentException("Table not found"));

		
		if(table.getIsReserved()) {
			 throw new IllegalStateException("Table is already reserved");
		}
		
		
		//Create new booking and setting the attribute
		Booking booking = new Booking();
        booking.setTableNumber(tableNumber);
        booking.setBookingId(bookingId);
        
        LocalDateTime currentTime = LocalDateTime.now();
        
        //Check if the booking is for current time if true than the type is set to OnArrival or it will be set to reservation 
        if(reservationTime.isAfter(currentTime)) {
        	booking.setBookingType("Reservation");
        	booking.setBookingTime(reservationTime);
        	table.setIsReserved(true);
        	table.setReservationTime(reservationTime);
        }else{
        	booking.setBookingType("On Arrival");
        	table.setIsReserved(true);
        	table.setReservationTime(currentTime);
        	booking.setBookingTime(currentTime);
        	
        }
        
        //Saving the table and booking entity
        bookingDao.save(booking);
        tableDao.save(table);
		
		
	}

	@Override
	public void deleteBooking(String tableNumber, String bookingId) {
		// TODO Auto-generated method stub
		
		
		Tables table = tableDao.findById(tableNumber) .orElseThrow(() -> new IllegalArgumentException("Entity not found"));
		
		if (!table.getIsReserved()) {
            throw new IllegalStateException("Table is not reserved");
        }
		
		table.setReservationTime(null);
		table.setIsReserved(false);
		tableDao.save(table);
		//Booking booking = bookingDao.findByTableNumber(tableNumber);
		bookingDao.deleteById(bookingId);
	}

	@Override
	public List<Booking> getAllBookings() {
		// TODO Auto-generated method stub
		return bookingDao.findAll();
	}
	

	@Override
	public void updateBooking(String bookingId, String newTableNumber, LocalDateTime reservationTime) {
		// TODO Auto-generated method stub
		
		Booking booking = bookingDao.findById(bookingId) .orElseThrow(() -> new IllegalArgumentException("Booking not found"));
		
		String oldTableNumber = booking.getTableNumber();
		
		Tables table = tableDao.findById(oldTableNumber) .orElseThrow(() -> new IllegalArgumentException("Table not found"));
		
		if (!table.getTableNumber().equals(booking.getTableNumber())){
	        throw new IllegalStateException("The booking does not belong to the specified table");
	    }
		
		
		
		booking.setTableNumber(newTableNumber);
		table.setTableNumber(newTableNumber);
		
		 // Update reservation time if provided
	    if (reservationTime != null) {
	        booking.setBookingTime(reservationTime);
	        table.setReservationTime(reservationTime);

	        // Update reservation status to 'true'
	        table.setIsReserved(true);
	    } else {
	        // Update reservation status to 'false' if reservation time is null
	        table.setIsReserved(false);
	    }

	    // Save the updated booking and entity
	    bookingDao.save(booking);
	    tableDao.save(table);

	    // If the table number is changed, update the reservation status of the previous table
	    if (oldTableNumber != newTableNumber) {
	        Tables previousTable = tableDao.findById(oldTableNumber).orElseThrow(() -> new IllegalArgumentException("table not found"));;
	        if (previousTable != null) {
	        	previousTable.setIsReserved(false);
	        	previousTable.setReservationTime(null);
	            tableDao.save(previousTable);
	        }
	    }
		
	}



	

}
