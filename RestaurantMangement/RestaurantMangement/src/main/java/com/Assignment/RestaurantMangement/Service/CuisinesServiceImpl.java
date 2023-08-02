package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Dao.CuisinesDao;
import com.Assignment.RestaurantMangement.Entities.Cuisines;


@Service
public class CuisinesServiceImpl implements CuisinesService{

	@Autowired
	private CuisinesDao cuisinesDao;
	
	@Override
	public List<Cuisines> getCuisines() {
		// TODO Auto-generated method stub
		return cuisinesDao.findAll();
	}

	@Override
	public Optional<Cuisines> getCuisine(String cuisinesId) {
		// TODO Auto-generated method stub
		return cuisinesDao.findById(cuisinesId);
	}

	@Override
	public Cuisines addCuisine(Cuisines cuisines) {
		// TODO Auto-generated method stub
		return cuisinesDao.save(cuisines);
	}

	@Override
	public Cuisines updateCuisine(Cuisines cuisines) {
		// TODO Auto-generated method stub
		return cuisinesDao.save(cuisines);
	}

	@Override
	public void deleteCuisine(String cuisineId) {
		// TODO Auto-generated method stub
		cuisinesDao.deleteById(cuisineId);
	}

	
	
	
}
