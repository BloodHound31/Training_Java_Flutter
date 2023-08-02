package com.Assignment.RestaurantMangement.Service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.CategoriesDao;
import com.Assignment.RestaurantMangement.Dao.CuisinesDao;
import com.Assignment.RestaurantMangement.Dao.MenuItemDao;
import com.Assignment.RestaurantMangement.Entities.Categories;
import com.Assignment.RestaurantMangement.Entities.Cuisines;
import com.Assignment.RestaurantMangement.Entities.MenuItems;


@Service
public class MenuItemServiceImpl implements MenuItemService{

	
	@Autowired
	private MenuItemDao menuItemsDao;

	@Autowired
	private CategoriesDao categoriesDao;
	
	@Autowired
	private CuisinesDao cuisinesDao;
	
	
	@Override
	public List<MenuItems> getMenuItems() {
		// TODO Auto-generated method stub
		return menuItemsDao.findAll();
	}

	@Override
	public Optional<MenuItems> getMenuItem(String menuItemsId) {
		// TODO Auto-generated method stub
		return menuItemsDao.findById(menuItemsId);
	}

	@Override
	public MenuItems addMenuItem(MenuItems menuItems) {
		// TODO Auto-generated method stub
		if (menuItems.getCategories() != null) {
			Categories categories = menuItems.getCategories();
			categoriesDao.save(categories);
			 }
		
		if (menuItems.getCuisines() != null) {
			Cuisines cuisines = menuItems.getCuisines();
			cuisinesDao.save(cuisines);
			 }
		return menuItemsDao.save(menuItems);
	}

	@Override
	public MenuItems updateMenuItems(MenuItems menuItems) {
		// TODO Auto-generated method stub
		return menuItemsDao.save(menuItems);
	}

	@Override
	public void deleteMenuItems(String menuItemsId) {
		// TODO Auto-generated method stub
		menuItemsDao.deleteById(menuItemsId);;
	}

	@Override
	public List<MenuItems> getMenuItemsByCategories(Categories categories) {
		// TODO Auto-generated method stub
		return menuItemsDao.findByCategories(categories);
	}

	@Override
	public List<MenuItems> getMenuItemsByCuisines(Cuisines cuisines) {
		// TODO Auto-generated method stub
		return menuItemsDao.findByCuisines(cuisines);
	}



}
