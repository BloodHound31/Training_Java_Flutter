package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Bill;
import com.LoginPage.login.Entity.UserDetails;
import com.LoginPage.login.Repository.BillRepository;
import com.LoginPage.login.Repository.UserDetailsRepository;


@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	
	@Autowired
	private UserDetailsRepository userDetailsRepo;
	
	@Autowired
	private BillRepository billRepository;
	
	@Override
	public List<UserDetails> getUserDetails() {
		// TODO Auto-generated method stub
		return userDetailsRepo.findAll();
	}

	@Override
	public UserDetails getUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDetailsRepo.findByUserName(userName);
	}

	@Override
	public UserDetails addUserDetails(UserDetails userDetails) {
		// TODO Auto-generated method stub
		UserDetails currentUser = userDetailsRepo.findByUserName(userDetails.getUserName());
		if(currentUser == null) {
				
			return userDetailsRepo.save(userDetails);
		}
		else 
		{
			return null;
		}
		
	}

	@Override
	public UserDetails addBillsToUser(String userName, Bill bill) {
		// TODO Auto-generated method stub
		UserDetails currenUserDetails = userDetailsRepo.findByUserName(userName);
		
		if(currenUserDetails  != null){
			List<Bill> currentBills = currenUserDetails.getBills();
			currentBills.add(bill);
			currenUserDetails.setBills(currentBills);
			
			bill.setUserDetails(currenUserDetails);
			billRepository.save(bill);
			return currenUserDetails;
		}
		else 
		{
			return null;
		}
		
		
	}
	

}
