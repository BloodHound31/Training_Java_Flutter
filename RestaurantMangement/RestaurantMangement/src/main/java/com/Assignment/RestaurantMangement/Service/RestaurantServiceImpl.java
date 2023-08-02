 package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.RestaurantDao;
import com.Assignment.RestaurantMangement.Entities.Restaurant;


@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	private RestaurantDao restaurantDao;
	
      public RestaurantServiceImpl() {
		
		
	 }

	@Override
	public List<Restaurant> getRestaurants() {
		// TODO Auto-generated method stub
		return restaurantDao.findAll();
	}

	@Override
	public Optional<Restaurant> getRestaurant(String restaurantId) {
		// TODO Auto-generated method stub
		return restaurantDao.findById(restaurantId);
	}

	@Override
	public Restaurant addRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		restaurantDao.save(restaurant);
		return restaurant;
	}

	@Override
	public Restaurant updateRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		restaurantDao.save(restaurant);
		return restaurant;
	}

	@Override
	public void deleteRestaurant(String restaurantId) {
		// TODO Auto-generated method stub
		restaurantDao.deleteById(restaurantId);
		
	}

}
