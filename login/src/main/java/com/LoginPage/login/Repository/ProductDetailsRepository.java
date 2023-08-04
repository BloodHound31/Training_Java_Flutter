package com.LoginPage.login.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.LoginPage.login.Entity.ProductDetails;


@Repository
public interface ProductDetailsRepository extends JpaRepository<ProductDetails, Integer>{

}
