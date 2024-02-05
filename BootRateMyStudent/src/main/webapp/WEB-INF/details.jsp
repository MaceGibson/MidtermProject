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
		${student.firstName} ${student.lastName} ${student.school.name}<br>
		<c:forEach var="review" items="${student.reviews }">
			${review.reviewText } <br>
		</c:forEach>
	</c:if>
</body>
</html>