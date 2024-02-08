<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Details Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <c:if test="${not empty school}">
            <div class="mb-3">
                <h3>Students in ${school.name}</h3>
                <ul class="list-group">
                <c:forEach var="student" items="${school.students}">
                <li class="list-group-item">
                    <a href="details.do?studentId=${student.id}" class="text-decoration-none">${student.firstName} ${student.lastName}</a><br>
                </li>
                </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${not empty student}">
            <div class="mb-3">
                <h3>${student.firstName} ${student.lastName}</h3>
                <p>${student.school.name}</p>
            </div>
            <div class="mb-3">
                <h4>Reviews</h4>
                <c:forEach var="review" items="${student.reviews}">
                    <div class="mb-3 border p-3">
                    	<h4>${review.title }</h4>
                    	<h6>${review.user.firstName} ${review.user.lastName}</h6>
                        <p>${review.reviewText}</p>
                        <c:if test="${review.user == sessionScope.loginUser || sessionScope.loginUser.role eq 'admin'}">
                            <a href="updateReviewForm.do?id=${review.id}" class="btn btn-sm btn-primary">Update Review</a>
                            <a href="deleteReview.do?id=${review.id}" class="btn btn-sm btn-danger">Delete Review</a>
                        </c:if>
                        <br>
                        <c:if test="${not empty review.comments}">
                        <div class="ms-3">
                            <h5>Comments:</h5>
                            <c:forEach var="comment" items="${review.comments}">
                            	<h6>${comment.user.firstName} ${comment.user.lastName}</h6>
                                <p>${comment.commentText}</p>
                                <c:if test="${comment.user == sessionScope.loginUser || sessionScope.loginUser.role eq 'admin'}">
                                    <a href="updateCommentForm.do?id=${comment.id}" class="btn btn-sm btn-primary">Update Comment</a>
                                    <a href="deleteComment.do?id=${comment.id}" class="btn btn-sm btn-danger">Delete Comment</a>
                                </c:if>
                                <br>
                            </c:forEach>
                        </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.loginUser}">
                            <form action="createComment.do" method="POST">
                                <input type="hidden" name="reviewId" value="${review.id}">
                                <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                                <div class="mb-3 ms-3">
                                    <label for="commentText">Leave a Comment:</label>
                                    <input type="text" name="commentText" class="form-control" placeholder="Write a comment">
                                </div>
                                <button type="submit" class="btn btn-primary ms-3">Submit</button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${not empty sessionScope.loginUser}">
                <div class="mb-3">
                    <h4>Add Review</h4>
                    <form action="createReview.do" method="POST">
                        <input type="hidden" name="studentId" value="${student.id}">
                        <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                        <div class="mb-3">
                            <label for="title">Title:</label>
                            <input type="text" name="title" class="form-control" placeholder="Title">
                        </div>
                        <div class="mb-3">
                            <label for="reviewText">Write a Review:</label>
                            <input type="text" name="reviewText" class="form-control" placeholder="Write a review">
                        </div>
                        <div class="mb-3">
                            <label for="subjectId">Subject:</label>
                            <select name="subjectId" class="form-select">
                                <option value="1">Defense Against the Dark Arts</option>
                                <option value="2">Potions</option>
                                <option value="3">Transfiguration</option>
                                <option value="4">Divination</option>
                                <option value="5">Administration</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="rating">Rating:</label>
                            <select name="rating" class="form-select">
                                <option value="1">*</option>
                                <option value="2">**</option>
                                <option value="3">***</option>
                                <option value="4">****</option>
                                <option value="5">*****</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </c:if>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
