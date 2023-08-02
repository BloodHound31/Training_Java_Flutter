package com.LoginPage.login.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.LoginPage.login.Dto.LoginDto;
import com.LoginPage.login.Dto.UsersDto;
import com.LoginPage.login.Entity.Users;
import com.LoginPage.login.Repository.UserRepository;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public String addUser(UsersDto usersDto) {
		// TODO Auto-generated method stub
		String message = "";
		Users user = new Users(
				usersDto.getUserId(),
				usersDto.getUserName(),
				usersDto.getEmailId(),
				this.passwordEncoder.encode(usersDto.getPassword()),
				usersDto.getDetails()
				);
		
		if(userRepo.findByUserName(user.getUserName()) != null) {
			message = "UserName Already Exist";
		}else if(userRepo.findByEmailId(user.getEmailId()) != null) {
			message = "Email already used";
		}else {
			message = user.getUserName();
			userRepo.save(user);
		}
		
		return message;
	}

	@Override
	public String loginUser(LoginDto loginDto) {
		// TODO Auto-generated method stub
		String message = "";
		Users userTemp = userRepo.findByEmailId(loginDto.getEmailId());
		if(userTemp != null) {
			String password = loginDto.getPassword();
			String encodedPassword = userTemp.getPassword();
			Boolean isRight = passwordEncoder.matches(password, encodedPassword);
			
			if(isRight) {
				Optional<Users> user = userRepo.findOneByEmailIdAndPassword(loginDto.getEmailId(), encodedPassword);
					message = userTemp.getDetails();
				}else {message = "Credentials are not valid";}
			}
		
			return message;
		}
		
	

	@Override
	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		return userRepo.findAll();
	}

	@Override
	public String changePassword(String emailId, String oldPassword, String newPassword) {
		// TODO Auto-generated method stub
		
		String message = "";
		Users user = userRepo.findByEmailId(emailId);
		String encodedPassword = user.getPassword();
		try 
		{
			
			if(passwordEncoder.matches(oldPassword, encodedPassword)) {
				
				if(!oldPassword.equals(newPassword)) {
					user.setPassword(this.passwordEncoder.encode(newPassword));
					this.userRepo.save(user);
					message = "password changed";
				}else {
					message = "new password is same as old one";
				}
				
				
			}else 
			{
				message = "Incorrect password";
			}
			
		}catch(Exception e){
			
			message = "Error:" + e; 
		}
		
		return message;
	}

	
	
}
