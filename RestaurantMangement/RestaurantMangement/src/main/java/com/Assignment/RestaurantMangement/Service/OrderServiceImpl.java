package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.MenuItemDao;
import com.Assignment.RestaurantMangement.Dao.OrdersDao;
import com.Assignment.RestaurantMangement.Entities.MenuItems;
import com.Assignment.RestaurantMangement.Entities.Orders;
import com.Assignment.RestaurantMangement.Entities.Tables;


@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private MenuItemDao menuItemDao;
	
	@Override
	public Orders createOrder(String orderId, String tableNumber, List<String> menuItemsId) {
		// TODO Auto-generated method stub
		
		Tables table = new Tables();
		table.setTableNumber(tableNumber);
		
		Orders order = new Orders();
		
		if(table.getIsReserved() == true) {
			
			
			order.setOrderId(orderId);
			order.setTableNumber(tableNumber);
			
			order.setMenuItems(menuItemDao.findAllById(menuItemsId));
			
			ordersDao.save(order);
		}else {
			new IllegalArgumentException("Table not valid for order");
		}
		
		
		return order;
	}

	@Override
	public List<Orders> getAllOrders() {
		// TODO Auto-generated method stub
		return ordersDao.findAll();
	}

	//@SuppressWarnings("unlikely-arg-type")
	@Override
	public Orders updateOrder(String orderId, String operation, List<String> menuItemsId) {
		// TODO Auto-generated method stub
		
		//Orders order = ordersDao.findById(orderId) .orElseThrow(() -> new IllegalArgumentException("Order ID not found"));
		
		if("Add".equalsIgnoreCase(operation)){
			
			//order.setMenuItems(menuItemDao.findAllById(menuItemsId));
			return this.addMenuItemToOrder(orderId, menuItemsId);
			
			
		}else if("Remove".equalsIgnoreCase(operation)) {
			
			//List<MenuItems> menuItem = menuItemDao.findAllById(menuItemsId);
			//order.getMenuItems().remove(menuItem);
			return this.removeMenuItemFromOrder(orderId, menuItemsId);
			
		}else { return null;}
		
		//ordersDao.save(order);
		
		
		//return order;
	}

	@Override
	public void deleteOrder(String orderId) {
		// TODO Auto-generated method stub
		
		ordersDao.deleteById(orderId);
		
	}
	
	public Orders addMenuItemToOrder(String orderId, List<String> menuItemId) {
        Orders order = ordersDao.findById(orderId).orElse(null);
        if (order != null) {
            List<MenuItems> menuItem = menuItemDao.findAllById(menuItemId);
            if (menuItem != null) {
                order.getMenuItems().addAll(menuItem);
                return ordersDao.save(order);
            }
        }
         return order;
    }
	
	 public Orders removeMenuItemFromOrder(String orderId, List<String> menuItemId) {
	        Orders order = ordersDao.findById(orderId).orElse(null);
	        if (order != null) {
	           List<MenuItems> menuItem = order.getMenuItems().stream().filter(item -> menuItemId.contains(item.getId())).collect(Collectors.toList());
	            if (menuItem != null) {
	                order.getMenuItems().removeAll(menuItem);
	                return ordersDao.save(order);
	            }
	        }
	        return order;
	    }

}
