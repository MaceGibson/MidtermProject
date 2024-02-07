package com.skilldistillery.ratemystudent.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ratemystudent.data.SchoolDAO;
import com.skilldistillery.ratemystudent.data.UserDAO;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private SchoolDAO schoolDAO;

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
	public String showStudent(@RequestParam("studentId") int id, Model model) {
		Student student = userDAO.findByStudentId(id);
		if (student != null) {
			model.addAttribute("student", student);
			return "details";
		}
		return "home";
	}

	@GetMapping(path = "details.do", params = "schoolId")
	public String showSchool(@RequestParam("schoolId") int id, Model model) {
		School school = schoolDAO.findBySchoolId(id);
		if (school != null) {
			model.addAttribute("school", school);
			return "details";
		}
		return "home";
	}

	@GetMapping("createStudent.do")
	public String createStudent() {
		return "createStudent";
	}

	@PostMapping("addedStudent.do")
	public String addedStudent(Student student, @RequestParam("userId") int userId, Model model) {
		Student newStudent = null;
		int userSchoolId = userDAO.findByUserId(userId).getSchool().getId();
		newStudent = schoolDAO.createStudent(student, userSchoolId);
		return "redirect:studentAdded.do?studentId=" + newStudent.getId();
	}

	@GetMapping("studentAdded.do")
	public String addedStudentDetails(@RequestParam("studentId") int studentId, Model model) {
		Student s = userDAO.findByStudentId(studentId);
		model.addAttribute("student", s);
		return "details";
	}

	@GetMapping("updateAccount.do")
	public String updateAccountDetails(Model model) {
		List<School> schools = schoolDAO.searchByschool("");
		model.addAttribute("schools", schools);
		return "accountUpdate";
	}

	@PostMapping("updateUser.do")
	public String updateUserDetails(User user, @RequestParam("schoolId") int schoolId,
			@RequestParam("subjectId") int subjectId, Model model, HttpSession session) {
		User updatedUser = userDAO.updateUser(user, schoolId, subjectId);
		User daoUser = userDAO.getUserByUserNameAndPassword(updatedUser.getUsername(), updatedUser.getPassword());
		if (daoUser != null) {
			session.setAttribute("loginUser", daoUser);
			return "account";
		} else {
			return "login";
		}
	}

	@PostMapping("createSchool.do")
	public String createSchool(@RequestParam("schoolName") String schoolName) {
		schoolDAO.createSchool(schoolName);
		return "redirect:updateAccount.do";
	}
}