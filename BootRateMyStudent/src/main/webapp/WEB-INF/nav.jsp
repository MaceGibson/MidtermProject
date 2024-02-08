<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%-- <nav>
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
</nav> --%>



<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">RateMyStudent</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
        <c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
		        <li class="nav-item">
		          <a class="nav-link" href="login.do">Account</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="logout.do">Logout</a>
		        </li>
	        </c:when>
	        <c:otherwise>
		        <li class="nav-item">
		          <a class="nav-link" href="login.do">Login</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="Register.do">Register</a>
		        </li>
	        </c:otherwise>
        </c:choose>
      </ul>
      
    </div>
  </div>
</nav>