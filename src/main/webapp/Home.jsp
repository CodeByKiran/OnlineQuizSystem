<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Home</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
</head>
<body>
    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp">Contact Us</a>
        <a href="login.jsp" style="float:right;">Login</a>
        <a href="admin_login.jsp" style="float:right;" class="active">Admin Login</a>
    </div>
    <div class="container">
        <h1>Welcome to the Online Quiz System</h1>
        <p>Our Online Quiz System is designed to offer a seamless and engaging way to test and enhance your knowledge across various subjects. Explore our features below:</p>
        <section class="project-overview">
            <h2>About the Project</h2>
            <p>This project provides a platform where users can participate in quizzes on various topics, track their progress, and view their results. It’s built with the latest technologies to ensure a smooth and interactive user experience.</p>
            <div class="images">
                <img src="images/quiz-example1.jpg" alt="Quiz Example 1">
                <img src="images/quiz-example2.jpg" alt="Quiz Example 2">
            </div>
        </section>
        <section class="process">
            <h2>How It Works</h2>
            <ol>
                <li><strong>Sign Up:</strong> Create an account to get started.</li>
                <li><strong>Select a Quiz:</strong> Choose from a variety of quizzes on different subjects.</li>
                <li><strong>Take the Quiz:</strong> Answer the questions and submit your responses.</li>
                <li><strong>View Results:</strong> Check your scores and review the correct answers.</li>
                <li><strong>Track Progress:</strong> Monitor your performance over time and improve your knowledge.</li>
            </ol>
        </section>
    </div>
    <footer>
        <p>&copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span></p>
    </footer>
</body>
</html>
