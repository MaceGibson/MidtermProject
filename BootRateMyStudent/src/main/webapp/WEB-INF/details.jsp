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
	<jsp:include page="nav.jsp"/>
	<c:if test="${not empty school}">
		<c:forEach var="student" items="${school.students }">
		<a href="details.do?studentId=${student.id}">${student.firstName} ${student.lastName}</a><br>
		</c:forEach>		
	</c:if>
	<c:if test="${not empty student}">
		${student.firstName} ${student.lastName}<br> 
		${student.school.name}<br>
		<c:forEach var="review" items="${student.reviews }">
			${review.reviewText } <br> 
			<c:if test="${review.user == sessionScope.loginUser}">
				<a href="updateReviewForm.do?id=${review.id}">Update Review</a>
				<a href="deleteReview.do?id=${review.id}">Delete Review</a><br>
			</c:if>
				<c:forEach var="comment" items="${review.comments }">
					${comment.commentText } 
					<c:if test="${comment.user == sessionScope.loginUser}">
						<a href="updateCommentForm.do?id=${comment.id}">Update Comment</a>
						<a href="deleteComment.do?id=${comment.id}">Delete Comment</a><br>
					</c:if><br>
					<%--
					<form action="createComment.do" method="POST">
						<input type="hidden" name="reviewId" value="${review.id}"> 
						<label for="commentText">Leave a Comment:</label>
						<input type="text" name="commentText" style= "height:50px; width:200px;" placeholder="write a comment">
						<button type="submit">Submit</button> 
					</form>
					--%>
				</c:forEach>
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser}">
			<form action="createComment.do" method="POST">
				<input type="hidden" name="reviewId" value="${review.id}"> 
				<input type="hidden" name="userId" value="${sessionScope.loginUser.id}"> 
				<label for="commentText">Leave a Comment:</label>
				<input type="text" name="commentText" style= "height:50px; width:200px;" placeholder="write a comment">
				<button type="submit">Submit</button> 
			</form>
		</c:when>
	</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<form action="createReview.do" method="POST">
					<input type="hidden" name="studentId" value="${student.id}"> 
					<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
					<label for="title">Title:</label>
					<input type="text" name="title" style= "height:10px; width:200px;">
					<label for="reviewText">Write a Review:</label>
					<input type="text" name="reviewText" style= "height:50px; width:200px;" placeholder="write a review">
					<label for="subjectId">Subject: </label> 
					<select name="subjectId" value="${review.subject.id}" required>
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
					<button type="submit">Submit</button> 
				</form>
			 </c:when>
		</c:choose>
	</c:if>
</body>
</html>