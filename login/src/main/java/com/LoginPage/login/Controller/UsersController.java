package com.LoginPage.login.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.LoginPage.login.Dto.LoginDto;
import com.LoginPage.login.Dto.UsersDto;
import com.LoginPage.login.Entity.Users;
import com.LoginPage.login.Service.UserService;


@RestController
@CrossOrigin
@RequestMapping("/")
public class UsersController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("Users")
	public List<Users> getUsers(){
		return userService.getUsers();
	}
	
	@PostMapping("Register/")
	public String RegisterUser(@RequestBody UsersDto usersDto) {
		return userService.addUser(usersDto);
	}
	
	@PostMapping("Login")
	public String LoginUser(@RequestBody LoginDto loginDto) {
		return userService.loginUser(loginDto);
	}
	
	@PostMapping("ChangePassword/")
	public String ChangePassword(@RequestParam(name="email") String emailId, @RequestParam(name="old") String oldPassword, @RequestParam(name="new") String newPassword) {
		
		return userService.changePassword(emailId, oldPassword, newPassword);
		
	}

}
