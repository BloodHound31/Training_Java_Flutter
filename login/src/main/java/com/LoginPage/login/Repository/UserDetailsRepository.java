package com.LoginPage.login.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.LoginPage.login.Entity.Bill;
import com.LoginPage.login.Entity.UserDetails;

@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetails, Integer>{
	UserDetails findByUserName(String userName);
	
	 

}
