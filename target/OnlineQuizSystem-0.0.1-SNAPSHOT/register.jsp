<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp">Contact Us</a>
        <a href="login.jsp" style="float:right;">Login</a>
    </div>

    <div class="container">
        <h1>Register</h1>
         <form action="RegisterServlet" method="post"> 
        <label for="username">Username (Roll Number):</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>

    <p><a href="login.jsp">Already have an account? Login here</a></p>
    </div>
    <footer>
    <p>&copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span></p>
   </footer>
</body>
</html>
