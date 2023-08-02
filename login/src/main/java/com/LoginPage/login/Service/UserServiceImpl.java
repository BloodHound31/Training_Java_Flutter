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
		Users user = new Users(
				usersDto.getUserId(),
				usersDto.getUserName(),
				usersDto.getEmailId(),
				this.passwordEncoder.encode(usersDto.getPassword()),
				usersDto.getDetails()
				);
		userRepo.save(user);
		return user.getUserName();
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

	
	
}
