package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.CategoriesDao;
import com.Assignment.RestaurantMangement.Entities.Categories;


@Service
public class CategoriesServiceImpl implements CategoriesService{

	@Autowired
	private CategoriesDao categoriesDao;
	
	
	@Override
	public List<Categories> getCategories() {
		// TODO Auto-generated method stub
		return categoriesDao.findAll();
	}

	@Override
	public Optional<Categories> getCategory(String categoriesId) {
		// TODO Auto-generated method stub
		return categoriesDao.findById(categoriesId);
	}

	@Override
	public Categories addCategory(Categories categories) {
		// TODO Auto-generated method stub
		return categoriesDao.save(categories);
	}

	@Override
	public Categories updateCategory(Categories categories) {
		// TODO Auto-generated method stub
		return categoriesDao.save(categories);
	}

	@Override
	public void deleteCategory(String categoriesId) {
		// TODO Auto-generated method stub
		categoriesDao.deleteById(categoriesId);
	}

}
