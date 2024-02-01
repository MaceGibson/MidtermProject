package com.skilldistillery.ratemystudent.data;

import com.skilldistillery.ratemystudent.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);

}
