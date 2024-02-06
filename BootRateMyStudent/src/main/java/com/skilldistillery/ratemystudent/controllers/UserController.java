package com.skilldistillery.ratemystudent.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.ratemystudent.data.SchoolDAO;
import com.skilldistillery.ratemystudent.data.UserDAO;
import com.skilldistillery.ratemystudent.entities.Comment;
import com.skilldistillery.ratemystudent.entities.Review;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private SchoolDAO schoolDAO;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		User u = userDAO.authenticateUser("teacher", "teacher");
		model.addAttribute("testUser", u);
		return "home";
	}

	@GetMapping(path = "searchSchoolResults.do")
	public String searchSchoolRequest(@RequestParam("school") String school, Model model) {
		List<School> schools = schoolDAO.searchByschool(school);
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
		School school = schoolDAO.findBySchoolId(id);
		if (school != null) {
			model.addAttribute("school", school);
			return "details";
		}
		return "home";
	}

	@PostMapping("createComment.do")
	public String createComment(@RequestParam("reviewId") int reviewId, @RequestParam("userId") int userId, Comment comment, Model model) {
		userDAO.createComment(comment, reviewId, userId);
		return "redirect:commentAdded.do?reviewId=" + reviewId;
	}
	
	@GetMapping(path="commentAdded.do")
	public String addedComment(@RequestParam("reviewId") int reviewId, Model model) {
		Review searchedReview = userDAO.findReviewById(reviewId);
		Student s = userDAO.findByStudentId(searchedReview.getStudent().getId());
		model.addAttribute("review", searchedReview);
		model.addAttribute("student", s);
		return "details";
	}

	@GetMapping("reviewForm.do")
	public String reviewForm() {
		return "reviewForm";
	}

	@PostMapping("createReview.do")
	public ModelAndView createReview(@RequestParam("studentId") int studentId, @RequestParam("userId") int userId, @RequestParam("subjectId") int subjectId, 
			Review review) {
		ModelAndView mv = new ModelAndView();
		Review createdReview = userDAO.createReview(review, studentId, userId, subjectId);
		mv.setViewName("redirect:reviewAdded.do?reviewId=" + createdReview.getId());
		return mv;
	}
	
	@GetMapping(path="reviewAdded.do")
	public String stubCreated(@RequestParam("reviewId") int reviewId, Model model) {
		Review searchedReview = userDAO.findReviewById(reviewId);
		Student s = userDAO.findByStudentId(searchedReview.getStudent().getId());
		model.addAttribute("review", searchedReview);
		model.addAttribute("student", s);
		return "details";
	}

	@GetMapping("updateCommentForm.do")
	public String updateCommentForm(@RequestParam("id") int id, Model model) {
		Comment comment = userDAO.findCommentById(id);
		if (comment != null) {
			model.addAttribute("comment", comment);
			return "updateCommentForm";
		}
		return "home";
	}

	@PostMapping("updateComment.do")
	public String updateComment(@RequestParam("commentId") int commentId,
			@RequestParam("commentText") String commentText, Model model) {
		Comment comment = userDAO.findCommentById(commentId);
		if (comment != null) {
			comment.setCommentText(commentText);
			Comment insertedComment = userDAO.updateComment(commentId, comment);
			model.addAttribute("student", insertedComment.getReview().getStudent());
			
			return "details";
		}
		return "home";
	}
	
	@GetMapping("updateReviewForm.do")
	public String updateReviewForm(@RequestParam("id") int id, Model model) {
		Review review = userDAO.findReviewById(id);
		if(review != null) {
			model.addAttribute("review", review);
			return "updateReviewForm";
		}
		return "home";
	}

	@GetMapping("updateReviewForm.do")
	public String updateReviewForm(@RequestParam("id") int id, Model model) {
		Review review = userDAO.findReviewById(id);
		if (review != null) {
			model.addAttribute("review", review);
			return "updateReviewForm";
		}
		return "home";
	}

	@PostMapping("updateReview.do")
	public String updateReview(Review updatedReview, @RequestParam("subjectId") int subjectId, Model model) {
		Review insertedReview = userDAO.updateReview(updatedReview, subjectId);
		model.addAttribute("student", insertedReview.getStudent());
			return "details";
	}

	@GetMapping("deleteComment.do")
	public String deleteComment(@RequestParam("id") int commentId, Model model) {
		Comment insertedComment = userDAO.findCommentById(commentId);
		boolean deleted = userDAO.deleteComment(commentId);
		if (deleted) {
			model.addAttribute("student", insertedComment.getReview().getStudent());
			return "details";
		} else {
			model.addAttribute("error", "Failed to delete comment");
			return "error";
		}
	}

	@GetMapping("deleteReview.do")
	public String deleteReview(@RequestParam("id") int reviewId, Model model) {
		Review insertedReview = userDAO.findReviewById(reviewId);
		boolean deleted = userDAO.deleteReview(reviewId);
		if (deleted) {
			model.addAttribute("student", insertedReview.getStudent());
			return "details";
		} else {
			model.addAttribute("error", "Failed to delete review");
			return "error";
		}
	}

}
