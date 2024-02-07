<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a student</title>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser && not empty sessionScope.loginUser.school}">
		<form action="addedStudent.do" method="POST">
			<input type="hidden" name="studentId" value="${student.id}"> 
			<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
			<label for="firstName">First Name:</label>
			<input type="text" name="firstName">
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName">
			<label for="graduationYear">Year Student Graduates:</label>
			<input type="text" name="graduationYear">
			<button type="submit">Submit</button> 
		</form>
		</c:when>
		<c:otherwise>
			please update your <a href="login.do">account page</a> with a school before adding a student.
		</c:otherwise>
	</c:choose>
</body>
</html>