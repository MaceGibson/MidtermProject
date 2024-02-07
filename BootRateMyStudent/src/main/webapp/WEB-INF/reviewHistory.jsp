<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Review History</title>
</head>
<body>
	<jsp:include page="nav.jsp"/>
		<c:forEach var="review" items="${sessionScope.loginUser.reviews }">
			<p><a href="details.do?studentId=${review.student.id}"><br>${review.title}</a> <br> 
			${review.reviewText}
				<a href="updateReviewForm.do?id=${review.id}">Update Review</a>
				<a href="deleteReview.do?id=${review.id}">Delete Review</a><br></p>
		</c:forEach>
</body>
</html>