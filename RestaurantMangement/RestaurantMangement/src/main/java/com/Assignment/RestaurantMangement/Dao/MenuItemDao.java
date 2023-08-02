package com.Assignment.RestaurantMangement.Dao;


import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.Assignment.RestaurantMangement.Entities.Categories;
import com.Assignment.RestaurantMangement.Entities.Cuisines;
import com.Assignment.RestaurantMangement.Entities.MenuItems;

@Repository
public interface MenuItemDao extends MongoRepository<MenuItems, String>{
	
	 List<MenuItems> findByCategories(Categories categories);
	 List<MenuItems> findByCuisines(Cuisines cuisines);
}
