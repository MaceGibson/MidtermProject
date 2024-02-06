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
	<jsp:include page="nav.jsp"/>
	<form action="updateReview.do" method="POST">
		<input type="hidden" name="id" value="${review.id}">
		<%-- <input type="hidden" name="student" value="${review.student}"> 
		<input type="hidden" name="user" value="${review.user}"> --%> 
		<label for="title">Title:</label>
		<input type="text" name="title" value="${review.title}" style= "height:10px; width:200px;">
		<label for="reviewText">Write a Review:</label>
		<input type="text" name="reviewText" style="height:50px; width:200px;" value="${review.reviewText}">
		<label for="subjectId">Subject: </label> 
		<select name="subjectId" required>
			<option value=1 ${review.subject.id == 1 ? 'selected' : ''}>Math</option>
			<option value=2 ${review.subject.id == 2 ? 'selected' : ''}>English</option>
			<option value=3 ${review.subject.id == 3 ? 'selected' : ''}>History</option>
			<option value=4 ${review.subject.id == 4 ? 'selected' : ''}>Science</option>
			<option value=5 ${review.subject.id == 5 ? 'selected' : ''}>Computer Science</option>
			<option value=6 ${review.subject.id == 6 ? 'selected' : ''}>Music</option>
		</select> 
		<label for="rating">Rating:</label>
		<select name="rating" required>
			<option value=1 ${review.rating == 1 ? 'selected' : ''}>*</option>
			<option value=2 ${review.rating == 2 ? 'selected' : ''}>**</option>
			<option value=3 ${review.rating == 3 ? 'selected' : ''}>***</option>
			<option value=4 ${review.rating == 4 ? 'selected' : ''}>****</option>
			<option value=5 ${review.rating == 5 ? 'selected' : ''}>*****</option>
		</select> 
		<button type="submit">Submit</button> 
	</form>
	
	${review.student.id}
	
</body>
</html>