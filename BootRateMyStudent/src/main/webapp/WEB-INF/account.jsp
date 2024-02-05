<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="nav.jsp"/>

<h2>Account Details</h2>

<%-- Output user details --%>
<c:choose>
	<c:when test="${not empty sessionScope.loginUser}">
		<h2>Username: <c:out value="${sessionScope.loginUser.username}"/></h2>
	</c:when>
	<c:otherwise>
		<h2>Not Logged In</h2>
	</c:otherwise>
</c:choose>
</body>
</html>