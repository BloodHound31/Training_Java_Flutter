package com.Assignment.RestaurantMangement.Dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Restaurant;


@Repository
public interface RestaurantDao extends MongoRepository<Restaurant, String> {

}
