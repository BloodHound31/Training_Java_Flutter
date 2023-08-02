package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Categories;
import com.Assignment.RestaurantMangement.Entities.Cuisines;
import com.Assignment.RestaurantMangement.Entities.MenuItems;


@Service
public interface MenuItemService {

	public List<MenuItems> getMenuItems();
	public Optional<MenuItems> getMenuItem(String menuItemsId);
	public MenuItems addMenuItem(MenuItems menuItems);
	public MenuItems updateMenuItems(MenuItems menuItems);
	public void deleteMenuItems(String menuItemsId);
	public List<MenuItems> getMenuItemsByCategories(Categories categories);
	public List<MenuItems> getMenuItemsByCuisines(Cuisines cuisines);
	
}
