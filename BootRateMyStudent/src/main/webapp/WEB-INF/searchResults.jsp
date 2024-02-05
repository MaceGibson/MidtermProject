<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Search Results Page
	<c:if test="${not empty schools}">
		search by school
	</c:if>
	<c:if test="${not empty students}">
		search by student
	</c:if>
</body>
</html>