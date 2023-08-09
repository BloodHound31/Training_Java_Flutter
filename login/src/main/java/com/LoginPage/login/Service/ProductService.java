package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LoginPage.login.Dto.StocksDto;
import com.LoginPage.login.Entity.Product;


@Service
public interface ProductService {
	
	public List<Product> getAllProducts();
	public Product addProduct(Product product);
	public List<Product> changeAvailableStocks(List<StocksDto> stocksDtoList);
	//public Product updateProduct(String productName, Product updatedProduct);

}
