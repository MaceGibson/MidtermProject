<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <h2 class="mb-4">Search Results Page</h2>
        <c:choose>
            <c:when test="${not empty schools}">
                <ul class="list-group">
                    <c:forEach var="school" items="${schools}">
                        <li class="list-group-item">
                            <a href="details.do?schoolId=${school.id}" class="text-decoration-none">${school.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:when test="${not empty students}">
                <ul class="list-group">
                    <c:forEach var="student" items="${students}">
                        <li class="list-group-item">
                            <a href="details.do?studentId=${student.id}" class="text-decoration-none">${student.firstName} ${student.lastName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <p>No Results Found.</p>
            </c:otherwise>
        </c:choose>
        <c:if test="${students != null && not empty sessionScope.loginUser}">
            <a href="createStudent.do" class="btn btn-primary mt-3">Add a Student</a>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
