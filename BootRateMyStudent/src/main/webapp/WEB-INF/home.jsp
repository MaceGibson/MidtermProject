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
	${testUser}
	Hello World
	<form action="searchResults.do" method="GET">
		<label for="school">Search By School</label><br>
		<input type="text" name="school"><br>
		<button type="submit"> Submit</button>
	</form>
	<form action="searchResults.do" method="GET">
		<label for="student">Search By Student</label><br>
		<input type="text" name="student"><br>
		<button type="submit">Submit</button>
	</form>
</body>
</html>