<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Review</title>
</head>
<body>
	<form action="updateReview.do" method="POST">
		<input type="hidden" name="studentId" value="${student.id}"> 
		<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
		<label for="title">Title:</label>
		<input type="text" name="title" style= "height:10px; width:200px;">
		<label for="reviewText">Write a Review:</label>
		<input type="text" name="reviewText" style= "height:50px; width:200px;" placeholder="write a review">
		<label for="subject">Subject: </label> 
		<select name="subject" value="${review.subject}" required>
			<option value=1>Math</option>
			<option value=2>English</option>
			<option value=3>History</option>
			<option value=4>Science</option>
			<option value=5>Computer Science</option>
			<option value=6>Music</option>
		</select> 
		<label for="rating">Rating:</label>
		<select name="rating" value="${review.rating}" required>
			<option value=1>*</option>
			<option value=2>**</option>
			<option value=3>***</option>
			<option value=4>****</option>
			<option value=5>*****</option>
		</select> 
	</form>
</body>
</html>