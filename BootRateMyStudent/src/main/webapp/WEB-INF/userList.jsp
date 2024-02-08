<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<jsp:include page="nav.jsp"/>
		<table>
			<c:forEach var="user" items="${users }">
			<tr>
				<td>
				${user.username }
				</td>
				<td>
					<form action="updateUserList.do" method="POST">
						<input type="hidden" name="id" value="${user.id }">
						<input type="hidden" name="keyword" value="${keyword }">
						<label for="password">Password:</label>
						<input type="text" name="password" value="${user.password }">
						<button type="submit">Change Password</button>
					</form>
				</td>
				<td>
						<c:if test="${user.enabled == true }">
							<form action="updateUserList.do" method="POST">
								<input type="hidden" name="id" value="${user.id }">
								<input type="hidden" name="keyword" value="${keyword }">
								<input type="hidden" name="enabled" value=false>
								<button type="submit">Disable</button>
							</form>
						</c:if>
						<c:if test="${user.enabled == false }">
							<form action="updateUserList.do" method="POST">
								<input type="hidden" name="id" value="${user.id }">
								<input type="hidden" name="keyword" value="${keyword }">
								<input type="hidden" name="enabled" value=true>
								<button type="submit">Enable</button>
							</form>
						</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>