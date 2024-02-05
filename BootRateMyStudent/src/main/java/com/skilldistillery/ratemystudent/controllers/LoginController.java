package com.skilldistillery.ratemystudent.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
}