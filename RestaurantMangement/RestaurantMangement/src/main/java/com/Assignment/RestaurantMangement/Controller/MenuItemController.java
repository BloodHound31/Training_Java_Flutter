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

import com.Assignment.RestaurantMangement.Entities.Categories;
import com.Assignment.RestaurantMangement.Entities.Cuisines;
import com.Assignment.RestaurantMangement.Entities.MenuItems;
import com.Assignment.RestaurantMangement.Service.MenuItemService;


@RequestMapping("/restaurant/Menu")
@RestController
public class MenuItemController {

	@Autowired
	private MenuItemService menuItemService;
	
	@GetMapping("/")
	public List<MenuItems> getRestaurants(){
		
		return this.menuItemService.getMenuItems();
	}
	
	@GetMapping("/{menuItemId}")
	public Optional<MenuItems> getRestaurant(@PathVariable String menuItemId){
		
		return this.menuItemService.getMenuItem(menuItemId);
	}
	
	@GetMapping("/Category/{categoryId}/")
	 public List<MenuItems> getMenuItemsByCategory(@PathVariable String categoryId){
		
		Categories categories = new Categories();
		categories.setId(categoryId);
		
		return menuItemService.getMenuItemsByCategories(categories);
	}
	
	@GetMapping("/Category/{cuisineId}/")
	 public List<MenuItems> getMenuItemsByCuisine(@PathVariable String cuisineId){
		
		Cuisines cuisines = new Cuisines();
		cuisines.setId(cuisineId);
		
		return menuItemService.getMenuItemsByCuisines(cuisines);
	}
	
	@PostMapping("/")
	public MenuItems addRestaurant(@RequestBody MenuItems menuItemId) {
		
		return this.menuItemService.addMenuItem(menuItemId);
	}
	
	@PutMapping("/")
	public MenuItems updateRestaurant(@RequestBody MenuItems menuItemId) {
		
		return this.menuItemService.updateMenuItems(menuItemId);
	}
	
	@DeleteMapping("/{menuItemId}/")
	 public ResponseEntity<HttpStatus> deleteRestaurant(@PathVariable String menuItemId) {
		
		 try {
		 this.menuItemService.deleteMenuItems(menuItemId);
		 return new ResponseEntity<>(HttpStatus.OK);
		  }catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }
	
	
}
