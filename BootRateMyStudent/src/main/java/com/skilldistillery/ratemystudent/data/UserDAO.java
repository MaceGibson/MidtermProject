package com.skilldistillery.ratemystudent.data;

import java.util.List;

import com.skilldistillery.ratemystudent.entities.Comment;
import com.skilldistillery.ratemystudent.entities.Review;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	List<School> searchByschool (String keyword);
	List<Student> searchByStudent (String keyword);
	Student findByStudentId(int id);
	School findBySchoolId(int id);
	User getUserByUserNameAndPassword(String username, String password);
	
	Review findReviewById(int id);
	Comment findCommentById(int id);
	
	//CRUD
	void createComment(Comment comment);
	void createReview(Review review);
	Comment updateComment(int id, Comment comment);
	Review updateReview(int id, Review review);
	boolean deleteComment(int id);
	boolean deleteReview(int id);

	User findByUserId(int id);
}
