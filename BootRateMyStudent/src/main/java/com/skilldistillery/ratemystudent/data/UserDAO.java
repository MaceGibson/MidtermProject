package com.skilldistillery.ratemystudent.data;

import java.util.List;

import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	List<School> searchByschool (String keyword);
	List<Student> searchByStudent (String keyword);
	Student findByStudentId(int id);
	School findBySchoolId(int id);
}
