package com.Assignment.RestaurantMangement.Dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Booking;


@Repository
public interface BookingDao extends MongoRepository<Booking, String>{
	
	public Booking findByTableNumber(String tableNumber);

}
