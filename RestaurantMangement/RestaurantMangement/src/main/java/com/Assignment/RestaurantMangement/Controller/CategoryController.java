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
import com.Assignment.RestaurantMangement.Service.CategoriesService;

@RequestMapping("/restaurant/Menu/Category")
@RestController
public class CategoryController {
	
	@Autowired
	private CategoriesService categoriesService;
	
	@GetMapping("/")
	public List<Categories> getCategories(){
		
		return this.categoriesService.getCategories();
	}
	
	@GetMapping("/{categoriesId}")
	public Optional<Categories> getCategory(@PathVariable String categoriesId){
		
		return this.categoriesService.getCategory(categoriesId);
	}
	
	@PostMapping("/")
	public Categories addCategory(@RequestBody Categories category) {
		
		return this.categoriesService.addCategory(category);
	}
	
	@PutMapping("/")
	public Categories updateCategory(@RequestBody Categories category) {
		
		return this.categoriesService.updateCategory(category);
	}
	
	@DeleteMapping("/{categoriesId}/")
	 public ResponseEntity<HttpStatus> deleteCategory(@PathVariable String categoriesId) {
		
		 try {
		 this.categoriesService.deleteCategory(categoriesId);
		 return new ResponseEntity<>(HttpStatus.OK);
		  }catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }

}
