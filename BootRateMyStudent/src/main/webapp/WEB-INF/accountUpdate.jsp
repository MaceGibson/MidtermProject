<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Account Information</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<jsp:include page="nav.jsp"/>

<h2>Update Account Information</h2>
	<c:choose>
	<c:when test="${not empty sessionScope.loginUser}">
		<form action="updateUser.do" method="POST">
			<input type="hidden" name="id" value="${sessionScope.loginUser.id}">
			<label for="username">Username:</label>
			<input type="text" name="username" value="<c:out value="${sessionScope.loginUser.username}"/>"> <br>
			<label for="firstName">First Name:</label>
			<input type="text" name="firstName" value="<c:out value="${sessionScope.loginUser.firstName}"/>"> <br>
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName" value="<c:out value="${sessionScope.loginUser.lastName}"/>"> <br>
			<label for="email">email:</label>
			<input type="text" name="email" value="<c:out value="${sessionScope.loginUser.email}"/>"> <br>
			<label for="subjectId">Subject:</label>
			<select name="subjectId" required>
							<option value=1 ${sessionScope.loginUser.subject.id == 1 ? 'selected' : ''}>Math</option>
							<option value=2 ${sessionScope.loginUser.subject.id == 2 ? 'selected' : ''}>English</option>
							<option value=3 ${sessionScope.loginUser.subject.id == 3 ? 'selected' : ''}>History</option>
							<option value=4 ${sessionScope.loginUser.subject.id == 4 ? 'selected' : ''}>Science</option>
							<option value=5 ${sessionScope.loginUser.subject.id == 5 ? 'selected' : ''}>Computer Science</option>
							<option value=6 ${sessionScope.loginUser.subject.id == 6 ? 'selected' : ''}>Music</option>
			</select>  <br>
			<label for="schoolId">School:</label>
			<select name="schoolId" required>
				<c:forEach var="school" items="${schools}">
				<option value="${school.id}" ${sessionScope.loginUser.school.id == school.id ? 'selected' : ''}>${school.name}</option>
				</c:forEach>
			</select>
			<button type="submit">Submit</button> 
		</form>
			<form action="createSchool.do" method="POST">
				<input type="text" name="schoolName" placeholder="Or add a school"> 
				<button type="submit">Add School</button><br>
			</form>
	</c:when>
	<c:otherwise>
		<h2>Not Logged In</h2>
	</c:otherwise>
</c:choose>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>