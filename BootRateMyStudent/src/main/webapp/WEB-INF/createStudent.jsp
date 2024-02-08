<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Student</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="nav.jsp"/>

<div class="container mt-5">
    <c:choose>
        <c:when test="${not empty sessionScope.loginUser && not empty sessionScope.loginUser.school}">
            <h2>Add a Student</h2>
            <form action="addedStudent.do" method="POST">
                <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name:</label>
                    <input type="text" name="firstName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name:</label>
                    <input type="text" name="lastName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="graduationYear" class="form-label">Year Student Graduates:</label>
                    <input type="text" name="graduationYear" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button> 
            </form>
        </c:when>
        <c:otherwise>
            <p>Please update your <a href="login.do">account page</a> with a school before adding a student.</p>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
