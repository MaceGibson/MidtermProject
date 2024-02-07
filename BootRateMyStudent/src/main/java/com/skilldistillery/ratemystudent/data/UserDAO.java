package com.skilldistillery.ratemystudent.data;

import java.util.List;

import com.skilldistillery.ratemystudent.entities.Comment;
import com.skilldistillery.ratemystudent.entities.Review;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.Subject;
import com.skilldistillery.ratemystudent.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	User getUserByUserNameAndPassword(String username, String password);
	
	
	List<Student> searchByStudent (String keyword);
	Student findByStudentId(int id);
	
	
	Review findReviewById(int id);
	Comment findCommentById(int id);
	
	//CRUD
	Comment createComment(Comment comment, int reviewId, int userId);
	Review createReview(Review review, int studentId, int userId, int subjectId);
	Comment updateComment(int id, Comment comment);
	Review updateReview(Review review, int subjectId);
	boolean deleteComment(int id);
	boolean deleteReview(int id);
	

	User findByUserId(int id);

	Subject findSubjectById(int subjectId);
}
