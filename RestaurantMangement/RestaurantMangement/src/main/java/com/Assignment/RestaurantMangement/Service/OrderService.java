package com.Assignment.RestaurantMangement.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Orders;

@Service
public interface OrderService {
	
	public Orders createOrder(String orderId, String tableNumber, List<String> menuItemsId);
	
	public List<Orders> getAllOrders();
	
	public Orders updateOrder(String orderId, String operation, List<String> menuItemsId);
	
	public void deleteOrder(String orderId);

	
}
