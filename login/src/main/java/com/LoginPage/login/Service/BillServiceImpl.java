package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Entity.Bill;
import com.LoginPage.login.Entity.UserDetails;
import com.LoginPage.login.Repository.BillRepository;


@Service
public class BillServiceImpl implements BillService{

	@Autowired
	private BillRepository billRepository;
	
	@Override
	public List<Bill> getBillByUser(String userName) {
		// TODO Auto-generated method stub
		
		return billRepository.findBillsByUserName(userName);
	}

	@Override
	public List<Bill> getAllBills() {
		// TODO Auto-generated method stub
		return billRepository.findAll();
	}

	@Override
	public void addBill(String userName,Bill bill) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getUserName(int billId) {
		// TODO Auto-generated method stub
		Bill bill = billRepository.getById(billId);
		UserDetails userTemp = bill.getUserDetails();
		
		
		return userTemp.getUserName();
	}

}
