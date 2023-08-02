package com.Assignment.RestaurantMangement.Dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Cuisines;

@Repository
public interface CuisinesDao extends MongoRepository<Cuisines, String>{

}
