<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Rate My Student!</title>
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
</body>
</html>