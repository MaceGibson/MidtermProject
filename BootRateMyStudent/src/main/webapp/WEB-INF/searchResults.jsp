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
	Search Results Page <br>
	<c:if test="${not empty schools}">
		<c:forEach var="school" items="${schools }">
			${school.name} <br>
		</c:forEach>		
	</c:if>
	<c:if test="${not empty students}">
		<c:forEach var="student" items="${students }">
			${student.firstName} ${student.lastName} <br>
		</c:forEach>		
	</c:if>
</body>
</html>