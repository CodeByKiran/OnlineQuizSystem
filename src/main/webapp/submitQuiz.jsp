<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Quiz</title>
<!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/submit.css">
</head>
<body>
    <form action="submitQuizServlet" method="post">
        <c:forEach var="question" items="${questions}">
            <div class="question-container">
                <p>${question.questionText}</p>
                <input type="radio" name="q${question.questionId}" value="1">
                ${question.option1}<br>
                <input type="radio" name="q${question.questionId}" value="2">
                ${question.option2}<br>
                <input type="radio" name="q${question.questionId}" value="3">
                ${question.option3}<br>
                <input type="radio" name="q${question.questionId}" value="4">
                ${question.option4}<br>
            </div>
        </c:forEach>
        <button type="submit">Submit Quiz</button>
    </form>
</body>
</html>