package com.LoginPage.login.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.LoginPage.login.Entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	Product findByProductName(String productName);

	
	
}
