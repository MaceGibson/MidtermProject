<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav>
	<a href="home.do">Home</a>
	<c:choose>
	<c:when test="${not empty sessionScope.loginUser}">
		<a href="login.do">Account</a>
		<br>
		<a href="logout.do">Logout</a>
	</c:when>
	<c:otherwise>
		<a href="login.do">Login</a>
		<br>
		<a href="register.do">Register</a>
	</c:otherwise>
</c:choose>
</nav>