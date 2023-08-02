package com.Assignment.RestaurantMangement.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Assignment.RestaurantMangement.Entities.Orders;
import com.Assignment.RestaurantMangement.Service.OrderService;

@RestController
@RequestMapping("/restaurant/Orders")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@PostMapping("/{orderId}/")
	public Orders createOrder(@PathVariable String orderId,@RequestParam(name ="tableNumber") String tableNumber, @RequestParam  (name = "menuItemId")List<String> menuItemId) {
		
		return orderService.createOrder(orderId, tableNumber, menuItemId);
	}
	
	@GetMapping("/")
	public List<Orders> getAllOrders(){
		
		return orderService.getAllOrders();
	}
	
	@DeleteMapping("/{orderId}/")
	public void deleteOrder(@PathVariable String orderId) {
		
		orderService.deleteOrder(orderId);
		
	}
	
	@PutMapping("/{orderId}/")
	public Orders updateOrder(@PathVariable String orderId, @RequestParam(name = "operations") String operations, @RequestParam(name = "menuItemId") List<String> menuItemId) {
		
		return orderService.updateOrder(orderId, operations, menuItemId);
	}

}
