<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Account Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <div class="container mt-5">
        <h2>Update Account Information</h2>
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <form action="updateUser.do" method="POST">
                    <input type="hidden" name="id" value="${sessionScope.loginUser.id}">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" name="username" class="form-control" value="<c:out value="${sessionScope.loginUser.username}"/>">
                    </div>
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name:</label>
                        <input type="text" name="firstName" class="form-control" value="<c:out value="${sessionScope.loginUser.firstName}"/>">
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name:</label>
                        <input type="text" name="lastName" class="form-control" value="<c:out value="${sessionScope.loginUser.lastName}"/>">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" name="email" class="form-control" value="<c:out value="${sessionScope.loginUser.email}"/>">
                    </div>
                    <div class="mb-3">
                        <label for="subjectId" class="form-label">Subject:</label>
                        <select name="subjectId" class="form-select" required>
                            <option value="1" ${sessionScope.loginUser.subject.id == 1 ? 'selected' : ''}>Defense Against the Dark Arts</option>
                            <option value="2" ${sessionScope.loginUser.subject.id == 2 ? 'selected' : ''}>Potions</option>
                            <option value="3" ${sessionScope.loginUser.subject.id == 3 ? 'selected' : ''}>Transfiguration</option>
                            <option value="4" ${sessionScope.loginUser.subject.id == 4 ? 'selected' : ''}>Divination</option>
                            <option value="5" ${sessionScope.loginUser.subject.id == 5 ? 'selected' : ''}>Administration</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="schoolId" class="form-label">School:</label>
                        <select name="schoolId" class="form-select" required>
                            <c:forEach var="school" items="${schools}">
                                <option value="${school.id}" ${sessionScope.loginUser.school.id == school.id ? 'selected' : ''}>${school.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                <form action="createSchool.do" method="POST">
                    <div class="mb-3">
                        <br><input type="text" name="schoolName" class="form-control" placeholder="Or add a school">
                    </div>
                    <button type="submit" class="btn btn-primary">Add School</button>
                </form>
            </c:when>
            <c:otherwise>
                <h2>Not Logged In</h2>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
