package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Bill;
import com.LoginPage.login.Entity.UserDetails;


@Service
public interface UserDetailsService {
	
	public List<UserDetails> getUserDetails();
	public UserDetails getUserByUserName(String userName);
	public UserDetails addUserDetails(UserDetails userDetails);
	
	public UserDetails addBillsToUser(String userName, Bill bills);
}
