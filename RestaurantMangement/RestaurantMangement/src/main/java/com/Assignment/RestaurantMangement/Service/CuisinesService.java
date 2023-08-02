package com.Assignment.RestaurantMangement.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Assignment.RestaurantMangement.Entities.Cuisines;


@Service
public interface CuisinesService {
	
	public List<Cuisines> getCuisines();
	public Optional<Cuisines> getCuisine(String cuisinesId);
	public Cuisines addCuisine(Cuisines cuisines);
	public Cuisines updateCuisine(Cuisines cuisines);
	public void deleteCuisine(String cuisineId);

}
