<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Comment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<form action="updateComment.do" method="POST">
		<%-- <input type="hidden" name="studentId" value="${student.id}"> 
		<input type="hidden" name="userId" value="${sessionScope.loginUser.id}"> --%>
		<input type="hidden" name="commentId" value="${comment.id}">
		
		<label for="commentText">Update your comment:</label>
		<input type="text" name="commentText" style= "height:50px; width:200px;" value="${comment.commentText }">
		<button type="submit">Submit</button> 
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>