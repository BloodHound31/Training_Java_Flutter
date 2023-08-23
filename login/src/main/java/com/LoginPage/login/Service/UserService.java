package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Dto.LoginDto;
import com.LoginPage.login.Dto.UsersDto;
import com.LoginPage.login.Entity.Users;


@Service
public interface UserService {
	
	ResponseEntity<String> addUser(UsersDto usersDto);
	ResponseEntity<String> loginUser(LoginDto loginDto);
	List<Users> getUsers();
	ResponseEntity<String> changePassword(String emailId,String oldPassword, String newPassword);

}
