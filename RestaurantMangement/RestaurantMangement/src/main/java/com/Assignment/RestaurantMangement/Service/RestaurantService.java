package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Restaurant;

@Service
public interface RestaurantService {
	
	public List<Restaurant> getRestaurants();
	public Optional<Restaurant> getRestaurant(String restaurantId);
	public Restaurant addRestaurant(Restaurant restaurant);
	public Restaurant updateRestaurant(Restaurant restaurant);
	public void deleteRestaurant(String restaurantId);

}
