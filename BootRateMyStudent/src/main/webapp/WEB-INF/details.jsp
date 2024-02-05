<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Page</title>
</head>
<body>
	<c:if test="${not empty school}">
		<c:forEach var="student" items="${school.students }">
			${student.firstName} ${student.lastName} <br>
			<c:forEach var="review" items="${student.reviews}">
			${review.reviewText}<br>
			</c:forEach>
		</c:forEach>		
	</c:if>
	<c:if test="${not empty student}">
		${student.firstName} ${student.lastName}<br> 
		${student.school.name}<br>
		<c:forEach var="review" items="${student.reviews }">
			${review.reviewText } <br>
	<form action="createComment.do" method="POST">
		<input type="hidden" name="reviewId" value="${review.id}"> 
		<label for="comment">Leave a Comment:</label>
		<input type="text" name="comment" rows="4" cols="50" value="${comment.commentText}" placeholder="write a comment">
		<button type="submit">Submit</button> 
	</form>
		</c:forEach>
	</c:if>
</body>
</html>