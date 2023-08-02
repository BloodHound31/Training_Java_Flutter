package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Categories;


@Service
public interface CategoriesService {
	
	public List<Categories> getCategories();
	public Optional<Categories> getCategory(String categoriesId);
	public Categories addCategory(Categories categories);
	public Categories updateCategory(Categories categories);
	public void deleteCategory(String categoriesId);

}
