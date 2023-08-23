package com.LoginPage.login.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
//	@Override
//	public String addUser(UsersDto usersDto) {
//		// TODO Auto-generated method stub
//		String message = "";
//		Users user = new Users(
//				usersDto.getUserId(),
//				usersDto.getUserName(),
//				usersDto.getEmailId(),
//				this.passwordEncoder.encode(usersDto.getPassword()),
//				usersDto.getDetails()
//				);
//		
//		if(userRepo.findByUserName(user.getUserName()) != null) {
//			message = "UserName Already Exist";
//		}else if(userRepo.findByEmailId(user.getEmailId()) != null) {
//			message = "Email already used";
//		}else {
//			message = user.getUserName();
//			userRepo.save(user);
//		}
//		
//		return message;
//	}

	

	@Override
    public ResponseEntity<String> addUser(UsersDto usersDto) {
        String message = "";
        Users user = new Users(
                usersDto.getUserId(),
                usersDto.getUserName(),
                usersDto.getEmailId(),
                this.passwordEncoder.encode(usersDto.getPassword()),
                usersDto.getDetails()
        );

        if (userRepo.findByUserName(user.getUserName()) != null) {
            message = "UserName Already Exist";
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
        } else if (userRepo.findByEmailId(user.getEmailId()) != null) {
            message = "Email already used";
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
        } else {
            message = user.getUserName();
            userRepo.save(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(message);
        }
    }
	
	@Override
	public ResponseEntity<String> loginUser(LoginDto loginDto) {
	    Users userTemp = userRepo.findByEmailId(loginDto.getEmailId());
	    if (userTemp != null) {
	        String password = loginDto.getPassword();
	        String encodedPassword = userTemp.getPassword();
	        Boolean isRight = passwordEncoder.matches(password, encodedPassword);

	        if (isRight) {
	            Optional<Users> user = userRepo.findOneByEmailIdAndPassword(loginDto.getEmailId(), encodedPassword);
	            // Assuming you want to return user details in the response body
	            return ResponseEntity.ok(userTemp.getDetails());
	        } else {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Credentials are not valid");
	        }
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
	    }
	}
		
	

	@Override
	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		return userRepo.findAll();
	}

	
	
	@Override
	public ResponseEntity<String> changePassword(String emailId, String oldPassword, String newPassword) {
	    String message = "";
	    HttpStatus status;

	    Users user = userRepo.findByEmailId(emailId);
	    String encodedPassword = user.getPassword();
	    
	    try {
	        if (passwordEncoder.matches(oldPassword, encodedPassword)) {
	            if (!oldPassword.equals(newPassword)) {
	                user.setPassword(this.passwordEncoder.encode(newPassword));
	                this.userRepo.save(user);
	                message = "Password changed";
	                status = HttpStatus.OK; // 200 OK
	            } else {
	                message = "New password is same as old one";
	                status = HttpStatus.BAD_REQUEST; // 400 Bad Request
	            }
	        } else {
	            message = "Incorrect password";
	            status = HttpStatus.UNAUTHORIZED; // 401 Unauthorized
	        }
	    } catch (Exception e) {
	        message = "Error: " + e;
	        status = HttpStatus.INTERNAL_SERVER_ERROR; // 500 Internal Server Error
	    }

	    return new ResponseEntity<>(message, status);
	}

	
	
}
