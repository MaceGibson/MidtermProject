<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">    
</head>
<body>
    <jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="updateReview.do" method="POST">
                    <input type="hidden" name="id" value="${review.id}">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title:</label>
                        <input type="text" name="title" class="form-control" value="${review.title}">
                    </div>
                    <div class="mb-3">
                        <label for="reviewText" class="form-label">Write a Review:</label>
                        <input type="text" name="reviewText" class="form-control" value="${review.reviewText}">
                    </div>
                    <div class="mb-3">
                        <label for="subjectId" class="form-label">Subject:</label>
                        <select name="subjectId" class="form-select" required>
                            <option value="1" ${review.subject.id == 1 ? 'selected' : ''}>Defense Against the Dark Arts</option>
                            <option value="2" ${review.subject.id == 2 ? 'selected' : ''}>Potions</option>
                            <option value="3" ${review.subject.id == 3 ? 'selected' : ''}>Transfiguration</option>
                            <option value="4" ${review.subject.id == 4 ? 'selected' : ''}>Divination</option>
                            <option value="5" ${review.subject.id == 5 ? 'selected' : ''}>Administration</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="rating" class="form-label">Rating:</label>
                        <select name="rating" class="form-select" required>
                            <option value="1" ${review.rating == 1 ? 'selected' : ''}>*</option>
                            <option value="2" ${review.rating == 2 ? 'selected' : ''}>**</option>
                            <option value="3" ${review.rating == 3 ? 'selected' : ''}>***</option>
                            <option value="4" ${review.rating == 4 ? 'selected' : ''}>****</option>
                            <option value="5" ${review.rating == 5 ? 'selected' : ''}>*****</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
