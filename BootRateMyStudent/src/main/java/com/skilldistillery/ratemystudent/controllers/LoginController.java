package com.skilldistillery.ratemystudent.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.ratemystudent.data.UserDAO;
import com.skilldistillery.ratemystudent.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping("login.do")
	public String login(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "account";
		} else {
			return "login";
		}
	}

	@PostMapping("login.do")
	public String loginPost(User user, HttpSession session) {
		User daoUser = userDAO.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());

		if (daoUser != null) {
			session.setAttribute("loginUser", daoUser);
			return "account";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = "logout.do")
	public ModelAndView doLogout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("loginUser");
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("register.do")
	public String registration() {
		return "registration";
	}

	@PostMapping("registerUser.do")
	public String addedUser(User user, @RequestParam("subjectId") int subjectId, @RequestParam("schoolId") int schoolId,
			@RequestParam("confirmPassword") String confirmPw) {
		if (user.getPassword().equals(confirmPw)) {
			userDAO.createUser(user, schoolId, subjectId);
			return "login";
		}
		return "registration";
	}

}