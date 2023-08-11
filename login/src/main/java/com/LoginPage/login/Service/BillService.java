package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Bill;


@Service
public interface BillService {
	
	public List<Bill> getBillByUser(String userName);
	
	public List<Bill> getAllBills();
	
	public void addBill(String userName,Bill bill);
	
	public String getUserName(int billId);

}
