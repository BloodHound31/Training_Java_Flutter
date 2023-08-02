package com.Assignment.RestaurantMangement.Dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.Assignment.RestaurantMangement.Entities.Orders;

public interface OrdersDao extends MongoRepository<Orders, String>{

}
