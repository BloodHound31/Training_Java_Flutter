package com.LoginPage.login.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.LoginPage.login.Entity.Bill;


@Repository
public interface BillRepository extends JpaRepository<Bill, Integer>{

	@Query("SELECT b FROM Bill b JOIN b.userDetails u WHERE u.userName = :userName")
 	List<Bill> findBillsByUserName(@Param("userName") String userName);
	
}
