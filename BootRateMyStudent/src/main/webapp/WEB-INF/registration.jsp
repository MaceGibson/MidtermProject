<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <h2>New User Registration</h2>
        <form action="registerUser.do" method="POST">
            <input type="hidden" name="role" value="user">
            <input type="hidden" name="enabled" value="true">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
            </div>
            <div class="mb-3">
                <label for="firstName" class="form-label">First Name:</label>
                <input type="text" name="firstName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name:</label>
                <input type="text" name="lastName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="subjectId" class="form-label">Subject:</label>
                <select name="subjectId" class="form-select" required>
                    <option value="1">Defense Against the Dark Arts</option>
                    <option value="2">Potions</option>
                    <option value="3">Transfiguration</option>
                    <option value="4">Divination</option>
                    <option value="5">Administration</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="schoolId" class="form-label">School:</label>
                <select name="schoolId" class="form-select">
                    <option value="0">School not listed</option>
                    <c:forEach var="school" items="${schools}">
                        <option value="${school.id}">${school.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>