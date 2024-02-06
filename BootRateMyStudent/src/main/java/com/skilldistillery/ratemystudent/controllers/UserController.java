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
}
