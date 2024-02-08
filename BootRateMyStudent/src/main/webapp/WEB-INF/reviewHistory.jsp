<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">    
    <style>
        .review {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }

        .review-title {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <c:forEach var="review" items="${sessionScope.loginUser.reviews }">
            <div class="review">
                <h3 class="review-title"><a href="details.do?studentId=${review.student.id}">${review.title}</a></h3>
                <p>${review.reviewText}</p>
                <div>
                    <a href="updateReviewForm.do?id=${review.id}" class="btn btn-primary">Update Review</a>
                    <a href="deleteReview.do?id=${review.id}" class="btn btn-danger">Delete Review</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
