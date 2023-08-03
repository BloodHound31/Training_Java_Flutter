package com.LoginPage.login.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.LoginPage.login.Entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

	
	
}
