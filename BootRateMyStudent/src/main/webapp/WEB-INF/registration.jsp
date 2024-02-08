<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	</head>
	<body>
	<jsp:include page="nav.jsp"/>
		<h2>New User Registration</h2>
		<form action="registerUser.do" method="POST">
			<input type="hidden" name="role" value="user">
			<input type="hidden" name="enabled" value=true>
			<label for="username">Username:</label>
	        <input type="text" name="username" required> <br>
	        <label for="password">Password:</label>
	        <input type="password" name="password" required> <br>
	        <label for="confirmPassword">Confirm Password:</label>
	        <input type="password" name="confirmPassword" placeholder="confirm password" required> <br>
	        <label for="firstName">First Name:</label>
	        <input type="text" name="firstName" required> <br>
	        <label for="lastName">Last Name:</label>
	        <input type="text" name="lastName" required> <br>
	        <label for="email">Email:</label>
	        <input type="email" name="email" required> <br>
	        <label for="subjectId">Subject:</label>
	        <select name="subjectId" required>
	            <option value="1">Math</option>
	            <option value="2">English</option>
	            <option value="3">History</option>
	            <option value="4">Science</option>
	            <option value="5">Computer Science</option>
	            <option value="6">Music</option>
	        </select> <br>
	        <label for="schoolId">School:</label>
	        <select name="schoolId">
	                <option value="0">School not listed</option>
	            <c:forEach var="school" items="${schools}">
	                <option value="${school.id}">${school.name}</option>
	            </c:forEach>
	        </select>
	        <button type="submit">Register</button>
	    </form>
			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
	</html>