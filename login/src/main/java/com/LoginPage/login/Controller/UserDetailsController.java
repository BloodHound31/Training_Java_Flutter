package com.LoginPage.login.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.LoginPage.login.Entity.Bill;
import com.LoginPage.login.Entity.UserDetails;
import com.LoginPage.login.Service.BillService;
import com.LoginPage.login.Service.UserDetailsService;

@RestController
@CrossOrigin
@RequestMapping("/")
public class UserDetailsController {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private BillService billService;
	
	@GetMapping("UserDetails")
	public List<UserDetails> getAllUserDetails(){
		
		return userDetailsService.getUserDetails();
	}
	
	
	@PostMapping("UserDetails")
	public UserDetails addUserDetails(@RequestBody UserDetails userDetails) {
		
		return userDetailsService.addUserDetails(userDetails);
	}
	
	
	@GetMapping("UserDetails/{userName}")
	public UserDetails getUserByUserName(@PathVariable String userName) {
		
		return userDetailsService.getUserByUserName(userName);
	}
	
	@PostMapping("UserDetails/{userName}/Bill")
	public UserDetails addBillsToUser(@PathVariable String userName, @RequestBody Bill bill) {
		return userDetailsService.addBillsToUser(userName, bill);
	}
	
	@GetMapping("Bills")
	public List<Bill> getAllBills(){
		return billService.getAllBills();
	}
	
	@GetMapping("Bills/{userName}")
	public List<Bill> getUserBills(@PathVariable String userName){
		return billService.getBillByUser(userName);
	}
	
	@GetMapping("Bills/")
	public String getUserNameStringFromBillId(@RequestParam(name = "billId") int billId) {
		return billService.getUserName(billId);
	}

}
