<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">    
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.username}</td>
                                <td>
                                    <form action="updateUserList.do" method="POST" class="d-flex">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <input type="hidden" name="keyword" value="${keyword}">
                                        <div class="form-group">
                                            <input type="text" name="password" value="${user.password}" class="form-control">
                                        </div>
                                        <button type="submit" class="btn btn-primary ms-2">Change Password</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="updateUserList.do" method="POST">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <input type="hidden" name="keyword" value="${keyword}">
                                        <c:choose>
                                            <c:when test="${user.enabled == true}">
                                                <input type="hidden" name="enabled" value="false">
                                                <button type="submit" class="btn btn-danger">Disable</button>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="enabled" value="true">
                                                <button type="submit" class="btn btn-success">Enable</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
