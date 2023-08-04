package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Product;
import com.LoginPage.login.Entity.ProductDetails;
import com.LoginPage.login.Repository.ProductDetailsRepository;
import com.LoginPage.login.Repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{

	
	@Autowired
	private ProductRepository productRepo;

	@Autowired
	private ProductDetailsRepository productDetailsRepo;
	
	
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productRepo.findAll();
	}

	@Override
	public Product addProduct(Product product) {
		// TODO Auto-generated method stub
		ProductDetails productDetails = product.getProductDetails();
		productDetailsRepo.save(productDetails);
		
		return productRepo.save(product);
	}

	@Override
	public Product getProductByName(String productName) {
		// TODO Auto-generated method stub
		return productRepo.findByProductName(productName);
	}

	@Override
	public Product updateProduct(String productName, Product updatedProduct) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
