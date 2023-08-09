package com.LoginPage.login.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Dto.StocksDto;
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
	public List<Product> changeAvailableStocks(List<StocksDto> stocksDtoList) {
		
		List<Product> updatedProducts = new ArrayList<>();
		
		for(StocksDto stocksDto: stocksDtoList) {
			Product currentProduct = productRepo.findByProductName(stocksDto.getProductName());
			if(currentProduct != null){
				ProductDetails currentProductDetails = currentProduct.getProductDetails();
				if(currentProductDetails != null) {
					currentProductDetails.setAvailableStock(stocksDto.getAvailableStocks());
					productDetailsRepo.save(currentProductDetails);
					updatedProducts.add(currentProduct);
				}
				
			}
		}
		
		return updatedProducts;
	}

	
	
	
	
	

}
