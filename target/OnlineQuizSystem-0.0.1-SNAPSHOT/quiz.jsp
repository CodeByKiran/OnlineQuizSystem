<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Quiz System - Quiz</title>
<link rel="stylesheet" href="styles.css">
<script>
    function startQuiz() {
     
        var quizSelect = document.getElementById('quizSelect');
        var selectedQuiz = quizSelect.value;

        if (selectedQuiz) {
            window.location.href = selectedQuiz + ".jsp";
        }
    }
</script>
</head>
<body>
	<div class="navbar">
		<a href="Home.jsp">Home</a> <a href="quiz.jsp">Quiz</a> <a
			href="results.jsp">Results</a> <a href="contact.jsp">Contact Us</a> <a
			href="login.jsp" style="float: right;">Login</a>
	</div>

	<div class="container">
		<h1>Quiz</h1>
		<p>Select a quiz to start:</p>

		<form onsubmit="event.preventDefault(); startQuiz();">
			<label for="quizSelect">Choose a quiz:</label>
			<select id="quizSelect" name="quiz">
				<option value="">--Select a Quiz--</option>
				<option value="math">Mathematics</option>
				<option value="bio">Biology</option>
				<option value="phy">Physics</option>
			</select>
			<button type="submit">Start Quiz</button>
		</form>
	</div>

	<footer>
		<p>
			&copy; 2024 Online Quiz System. All rights reserved. <span
				class="heart">&#10084;</span>
		</p>
	</footer>
</body>
</html>
