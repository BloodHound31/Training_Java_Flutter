package com.LoginPage.login.Repository;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.LoginPage.login.Entity.Users;


@Repository
public interface UserRepository extends JpaRepository<Users, Integer>{

	Optional<Users> findOneByEmailIdAndPassword(String emailId, String password);
    Users findByEmailId(String emailId);
    Users findByUserName(String userName);
	
}
