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

import com.Assignment.RestaurantMangement.Entities.Tables;
import com.Assignment.RestaurantMangement.Service.TableService;


@RequestMapping("/restaurant/tables")
@RestController
public class TableController {

	@Autowired
	private TableService tableService;
	
	@GetMapping("/")
	public List<Tables> getTables(){
		
		return this.tableService.getTables();
	}
	
	
	@GetMapping("/{tableNumber}")
	public Optional<Tables> getTable(@PathVariable String tableNumber) {
		
		return this.tableService.getTable(tableNumber);
	}
	
	@PostMapping("/")
	public Tables addTable(@RequestBody Tables table) {
		
		return this.tableService.addTable(table);
	}
	
	@PutMapping("/")
	public Tables updateTable(@RequestBody Tables table) {
		
		return this.tableService.updateTable(table);
	}
	
	@DeleteMapping("/{tableNumber}")
	 public ResponseEntity<HttpStatus> deleteRestaurant(@PathVariable String tableNumber) {
		
		 try {
		 this.tableService.deleteTable(tableNumber);
		 return new ResponseEntity<>(HttpStatus.OK);
		  }catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }
	
	//Gets Table By Id of restaurant
	@GetMapping("/{restaurantId}/")
	public List<Tables> getByRestaurant(@PathVariable String restaurantId)
	{
		return this.tableService.getByRestaurant(restaurantId);
	}
	
	@GetMapping("/Reserved/")
	public List<Tables> getReservedTables(){
		
		return this.tableService.getReservedTables();
	}
	
	@GetMapping("/UnReserved/")
	public List<Tables> getUnreservedTables(){
		
		return this.tableService.getOpenTables();
	}
	
	
}
