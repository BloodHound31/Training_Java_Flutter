package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Tables;


@Service
public interface TableService {
	
	public List<Tables> getTables();
	public List<Tables> getReservedTables();
	public List<Tables> getOpenTables();
	public Optional<Tables> getTable(String tableNumber);
	public Tables addTable(Tables table);
	public Tables updateTable(Tables table);
	public void deleteTable(String tableNumber);
	public List<Tables> getByRestaurant(String restaurantId);

}
