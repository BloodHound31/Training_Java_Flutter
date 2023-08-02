package com.Assignment.RestaurantMangement.Dao;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Tables;


@Repository
public interface TableDao extends MongoRepository<Tables, String>{
	
	List<Tables> findByRestaurantId(String restaurantId);
	
	List<Tables> findByIsReserved(Boolean isReserved);

}
