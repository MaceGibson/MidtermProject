<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Rate My Student!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<jsp:include page="nav.jsp"/>
	<form action="searchSchoolResults.do" method="GET">
		<label for="school">Search By School</label><br>
		<input type="text" name="school"><br>
		<button type="submit"> Submit</button>
	</form>
	<form action="searchStudentResults.do" method="GET">
		<label for="student">Search By Student</label><br>
		<input type="text" name="student"><br>
		<button type="submit">Submit</button>
	</form>
	<c:if test="${sessionScope.loginUser.role eq 'admin'}">
	<form action="userList.do" method="GET">
		<label for="keyword">Search By User</label><br>
		<input type="text" name="keyword"><br>
		<button type="submit">Submit</button>
	</form>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>