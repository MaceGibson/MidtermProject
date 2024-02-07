<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Account Information</title>
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
			<label for="school">School:</label>
			<select name="schoolId" required>
				<c:forEach var="school" items="${schools}">
				<option value="${school.id}" ${sessionScope.loginUser.school.id == school.id ? 'selected' : ''}>${school.name}</option>
				</c:forEach>
			</select>
				<a href="createSchool.do">Add a School</a> <br>
			<label for="subject">Subject:</label>
			<select name="subjectId" required>
							<option value=1 ${sessionScope.loginUser.subject.id == 1 ? 'selected' : ''}>Math</option>
							<option value=2 ${sessionScope.loginUser.subject.id == 2 ? 'selected' : ''}>English</option>
							<option value=3 ${sessionScope.loginUser.subject.id == 3 ? 'selected' : ''}>History</option>
							<option value=4 ${sessionScope.loginUser.subject.id == 4 ? 'selected' : ''}>Science</option>
							<option value=5 ${sessionScope.loginUser.subject.id == 5 ? 'selected' : ''}>Computer Science</option>
							<option value=6 ${sessionScope.loginUser.subject.id == 6 ? 'selected' : ''}>Music</option>
			</select> 
			<button type="submit">Submit</button> 
		</form>
	</c:when>
	<c:otherwise>
		<h2>Not Logged In</h2>
	</c:otherwise>
</c:choose>
</body>
</html>