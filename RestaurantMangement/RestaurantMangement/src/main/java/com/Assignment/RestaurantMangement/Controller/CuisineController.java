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

import com.Assignment.RestaurantMangement.Entities.Cuisines;
import com.Assignment.RestaurantMangement.Service.CuisinesService;

@RequestMapping("/restaurant/Menu/Cuisines")
@RestController
public class CuisineController {

	@Autowired
	private CuisinesService cuisinesService;
	
	
	@GetMapping("/")
	public List<Cuisines> getCategories(){
		
		return this.cuisinesService.getCuisines();
	}
	
	@GetMapping("/{cuisineId}")
	public Optional<Cuisines> getCuisine(@PathVariable String cuisineId){
		
		return this.cuisinesService.getCuisine(cuisineId);
	}
	
	@PostMapping("/")
	public Cuisines addCuisine(@RequestBody Cuisines cuisines) {
		
		return this.cuisinesService.addCuisine(cuisines);
	}
	
	@PutMapping("/")
	public Cuisines updateCuisine(@RequestBody Cuisines cuisines) {
		
		return this.cuisinesService.updateCuisine(cuisines);
	}
	
	@DeleteMapping("/{cuisineId}/")
	 public ResponseEntity<HttpStatus> deleteCuisine(@PathVariable String cuisineId) {
		
		 try {
		 this.cuisinesService.deleteCuisine(cuisineId);
		 return new ResponseEntity<>(HttpStatus.OK);
		  }catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }
	
}
