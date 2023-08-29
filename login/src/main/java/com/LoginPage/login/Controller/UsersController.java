package com.LoginPage.login.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
		try {
            Thread.sleep(5000); // Delay for 5 seconds
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt(); // Restore the interrupted status
            // Handle the interruption or log the error here
        }
		//Thread.sleep(5000);
		List<Users> users = userService.getUsers();
		return users;
	}
	
	@PostMapping("Register")
	public ResponseEntity<String> RegisterUser(@RequestBody UsersDto usersDto) {
		return userService.addUser(usersDto);
	}
	
	@PostMapping("Login")
	public ResponseEntity<String> LoginUser(@RequestBody LoginDto loginDto) {
		
		try {
            Thread.sleep(5000); // Delay for 5 seconds
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt(); // Restore the interrupted status
            // Handle the interruption or log the error here
        }
		
		ResponseEntity<String> apiResponse = userService.loginUser(loginDto);
		
		return apiResponse;
	}
	
	@PostMapping("ChangePassword")
	public ResponseEntity<String> ChangePassword(@RequestParam(name="email") String emailId, @RequestParam(name="old") String oldPassword, @RequestParam(name="new") String newPassword) {
		
		return userService.changePassword(emailId, oldPassword, newPassword);
		
	}

}
