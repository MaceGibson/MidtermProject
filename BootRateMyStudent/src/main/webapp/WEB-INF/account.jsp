<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>

<div class=".container-fluid text-center m-5">
	<h2>Account Details</h2>

<%-- Output user details --%>
	<c:choose>
	<c:when test="${not empty sessionScope.loginUser}">
		<ul class="list-group">
			<li class="list-group-item"><h2>Username: <c:out value="${sessionScope.loginUser.username}"/></h2></li>
			<li class="list-group-item"><h2>First Name: <c:out value="${sessionScope.loginUser.firstName}"/></h2></li>
			<li class="list-group-item"><h2>Last Name: <c:out value="${sessionScope.loginUser.lastName}"/></h2></li>
			<li class="list-group-item"><h2>School: <c:out value="${sessionScope.loginUser.school.name}"/></h2></li>
			<li class="list-group-item"><h2>Subject: <c:out value="${sessionScope.loginUser.subject.name}"/></h2></li>
		</ul>
		<button onclick="window.location.href='updateAccount.do'" class="btn btn-primary m-2">Update Account Information</button><br>
		<button onclick="window.location.href='reviewHistory.do'" class="btn btn-secondary">Review History</button>

	</c:when>
	<c:otherwise>
		<h2>Not Logged In</h2>
	</c:otherwise>
	</c:choose>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>