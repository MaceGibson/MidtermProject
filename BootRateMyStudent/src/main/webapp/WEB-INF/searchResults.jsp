<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<jsp:include page="nav.jsp"/>
	Search Results Page <br>
	<c:choose>
		<c:when test="${not empty schools}">
			<c:forEach var="school" items="${schools }">
				<a href="details.do?schoolId=${school.id}">${school.name}</a> <br>
			</c:forEach>		
		</c:when>
		<c:when test="${not empty students}">
			<c:forEach var="student" items="${students }">
				<a href="details.do?studentId=${student.id}">${student.firstName} ${student.lastName}</a><br>
			</c:forEach>		
		</c:when>
		<c:otherwise>
			No Results Found.
		</c:otherwise>
	</c:choose>
		<c:if test="${students != null && not empty sessionScope.loginUser}">
			<a href="createStudent.do">Add a Student</a> <br>
		</c:if>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>