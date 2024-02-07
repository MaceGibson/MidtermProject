<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
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
</body>
</html>