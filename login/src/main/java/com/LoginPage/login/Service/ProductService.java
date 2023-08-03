package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Product;


@Service
public interface ProductService {
	
	public List<Product> getAllProducts();
	public Product addProduct(Product product);

}
