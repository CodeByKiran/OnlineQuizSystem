<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Contact Us</title>
    <!-- Link to external CSS file -->
    <!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/contact.css">
</head>
<body>
    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp" class="active">Contact Us</a>
        <a href="login.jsp" style="float:right;">Login</a>
        <a href="admin_login.jsp" style="float:right;">Admin Login</a>
    </div>

    <div class="container">
        <h1>Contact Us</h1>
        <p>If you have any questions or need support, please fill out the form below:</p>
        
        <form action="ContactServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>

            <button type="submit">Submit</button>
        </form>
         <p>For Technical Support Contact </p>
        <p>Email: saikiransalani@gmail.com</p>
        <p>Phone: 9676560491</p>
    </div>
    
    <footer>
        <p>&copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span></p>
    </footer>
</body>
</html>
