package com.Assignment.RestaurantMangement.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Assignment.RestaurantMangement.Entities.Restaurant;
import com.Assignment.RestaurantMangement.Service.RestaurantService;


@RequestMapping("/restaurant")
@RestController
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/")
	public List<Restaurant> getRestaurants(){
		
		return this.restaurantService.getRestaurants();
	}
	
	@GetMapping("/{Id}/")
	public Optional<Restaurant> getRestaurant(@PathVariable String Id){
		
		return this.restaurantService.getRestaurant(Id);
	}
	
	@PostMapping("/")
	public Restaurant addRestaurant(@RequestBody Restaurant restaurant) {
		
		return this.restaurantService.addRestaurant(restaurant);
	}
	
	@PutMapping("/")
	public Restaurant updateRestaurant(@RequestBody Restaurant restaurant) {
		
		return this.restaurantService.updateRestaurant(restaurant);
	}
	
	@DeleteMapping("/{restaurantId}/")
	 public ResponseEntity<HttpStatus> deleteRestaurant(@PathVariable String restaurantId) {
		
		 try {
		 this.restaurantService.deleteRestaurant(restaurantId);
		 return new ResponseEntity<>(HttpStatus.OK);
		  }catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }

}
