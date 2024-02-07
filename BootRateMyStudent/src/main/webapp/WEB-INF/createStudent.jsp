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
	<c:if test="${not empty sessionScope.loginUser}">
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
	</c:if>
</body>
</html>