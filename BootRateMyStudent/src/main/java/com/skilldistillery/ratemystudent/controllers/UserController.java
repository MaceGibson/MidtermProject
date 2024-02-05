package com.skilldistillery.ratemystudent.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.ratemystudent.data.UserDAO;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping(path={"/", "home.do"})
	public String home(Model model) {
		User u = userDAO.authenticateUser("teacher", "teacher");
		model.addAttribute("testUser", u);
		return "home";
	}
	
	@GetMapping(path="searchSchoolResults.do")
	public String searchSchoolRequest(@RequestParam("school") String school, Model model) {
		List<School> schools = userDAO.searchByschool(school);
		model.addAttribute("schools", schools);
		return "searchResults";
	}
	
	@GetMapping(path="searchStudentResults.do")
	public String searchStudentRequest(@RequestParam("student") String student, Model model) {
		System.out.println("Before DAO");
		List<Student> students = userDAO.searchByStudent(student);
		System.out.println("After DAO");
		model.addAttribute("students", students);
		return "searchResults";
	}

}
