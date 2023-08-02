package com.Assignment.RestaurantMangement.Dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Categories;

@Repository
public interface CategoriesDao extends MongoRepository<Categories, String>{

}
