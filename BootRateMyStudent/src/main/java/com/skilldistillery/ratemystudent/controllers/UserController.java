package com.skilldistillery.ratemystudent.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ratemystudent.data.UserDAO;
import com.skilldistillery.ratemystudent.entities.Comment;
import com.skilldistillery.ratemystudent.entities.Review;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		User u = userDAO.authenticateUser("teacher", "teacher");
		model.addAttribute("testUser", u);
		return "home";
	}

	@GetMapping(path = "searchSchoolResults.do")
	public String searchSchoolRequest(@RequestParam("school") String school, Model model) {
		List<School> schools = userDAO.searchByschool(school);
		model.addAttribute("schools", schools);
		return "searchResults";
	}

	@GetMapping(path = "searchStudentResults.do")
	public String searchStudentRequest(@RequestParam("student") String student, Model model) {
		List<Student> students = userDAO.searchByStudent(student);
		model.addAttribute("students", students);
		return "searchResults";
	}

	@GetMapping(path = "details.do", params = "studentId")
	private String showStudent(@RequestParam("studentId") int id, Model model) {
		Student student = userDAO.findByStudentId(id);
		if (student != null) {
			model.addAttribute("student", student);
			return "details";
		}
		return "home";
	}

	@GetMapping(path = "details.do", params = "schoolId")
	private String showSchool(@RequestParam("schoolId") int id, Model model) {
		School school = userDAO.findBySchoolId(id);
		if (school != null) {
			model.addAttribute("school", school);
			return "details";
		}
		return "home";
	}

	@PostMapping("createComment.do")
	public String createComment(@RequestParam("reviewId") int reviewId, Comment comment, Model model) {// @RequestParam("commentText")
																										// String
																										// commentText)
																										// {
//		Comment com = new Comment();
//		com.setCommentText(commentText);
//		com.setReview(userDAO.findReviewById(reviewId));
//        userDAO.createComment(com);
		Review r = userDAO.findReviewById(reviewId);
		comment.setReview(r);
		Student student = userDAO.findByStudentId(r.getStudent().getId());
		model.addAttribute("student", student);
		userDAO.createComment(comment);

		return "details";
	}

	@GetMapping("reviewForm.do")
	public String reviewForm() {
		return "reviewForm";
	}

	@PostMapping("createReview.do")
	public String createReview(@RequestParam("studentId") int studentId, @RequestParam("userId") int userId,
			Review review, Model model, HttpSession session) {
		Student s = userDAO.findByStudentId(studentId);
		User u = userDAO.findByUserId(userId);
		review.setStudent(s);
		review.setUser(u);
		userDAO.createReview(review);
		model.addAttribute("student", s);
		return "details";
	}

	@GetMapping("updateCommentForm.do")
	public String updateCommentForm() {
		return "updateCommentForm.do";
	}

	@PostMapping("updateComment.do")
	public String updateComment(@RequestParam("commentId") int commentId,
			@RequestParam("commentText") String commentText, Model model) {
		Comment comment = userDAO.findCommentById(commentId);
		if (comment != null) {
			comment.setCommentText(commentText);
			userDAO.updateComment(commentId, comment);
			model.addAttribute("comment", comment);
			return "details";
		}
		return "home";
	}

	@PostMapping("updateReview.do")
	public String updateReview(@RequestParam("reviewId") int reviewId, @RequestParam("reviewText") String reviewText,
			Model model) {
		Review review = userDAO.findReviewById(reviewId);
		if (review != null) {
			review.setReviewText(reviewText);
			userDAO.updateReview(reviewId, review);
			model.addAttribute("review", review);
			return "details";
		}
		return "home";
	}

	@PostMapping("deleteComment.do")
	public String deleteComment(@RequestParam("commentId") int commentId, Model model) {
		boolean deleted = userDAO.deleteComment(commentId);
		if (deleted) {
			return "redirect:/home.do";
		} else {
			model.addAttribute("error", "Failed to delete comment");
			return "error";
		}
	}

	@PostMapping("deleteReview.do")
	public String deleteReview(@RequestParam("reviewId") int reviewId, Model model) {
		boolean deleted = userDAO.deleteReview(reviewId);
		if (deleted) {
			return "redirect:/home.do";
		} else {
			model.addAttribute("error", "Failed to delete review");
			return "error";
		}
	}

}
