package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.RestaurantDao;
import com.Assignment.RestaurantMangement.Dao.TableDao;
import com.Assignment.RestaurantMangement.Entities.Restaurant;
import com.Assignment.RestaurantMangement.Entities.Tables;



@Service
public class TableServiceImpl implements TableService{
	
	@Autowired
	private TableDao tableDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	public TableServiceImpl() {}

	public List<Tables> getTables() {
		// TODO Auto-generated method stub
		return tableDao.findAll();
	}

	@Override
	public Optional<Tables> getTable(String tableNumber) {
		// TODO Auto-generated method stub
		return tableDao.findById(tableNumber);
	}

	@Override
	public Tables addTable(Tables table) {
		// TODO Auto-generated method stub
		
		//This will create a restaurant if no restaurant with the id is found
		 if (table.getRestaurant() != null) {
		Restaurant restaurant = table.getRestaurant();
		restaurantDao.save(restaurant);
		 }
		 
		 
		return tableDao.save(table);
	}

	@Override
	public Tables updateTable(Tables table) {
		// TODO Auto-generated method stub
		return tableDao.save(table);
	}

	@Override
	public void deleteTable(String tableNumber) {
		// TODO Auto-generated method stub
		tableDao.deleteById(tableNumber);
		
	}

	@Override
	public List<Tables> getByRestaurant(String restaurantId) {
		// TODO Auto-generated method stub
		return tableDao.findByRestaurantId(restaurantId);
	}

	@Override
	public List<Tables> getReservedTables() {
		// TODO Auto-generated method stub
		
		return tableDao.findByIsReserved(true);
	}

	@Override
	public List<Tables> getOpenTables() {
		// TODO Auto-generated method stub
		return tableDao.findByIsReserved(false);
	}
		

}
