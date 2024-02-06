<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Comment</title>
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
</body>
</html>