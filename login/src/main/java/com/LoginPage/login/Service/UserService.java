package com.LoginPage.login.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LoginPage.login.Dto.LoginDto;
import com.LoginPage.login.Dto.UsersDto;
import com.LoginPage.login.Entity.Users;


@Service
public interface UserService {
	
	String addUser(UsersDto usersDto);
	String loginUser(LoginDto loginDto);
	List<Users> getUsers();

}
