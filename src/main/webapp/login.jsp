<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Quiz System - Login</title>
<!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
</head>
<body>
	<div class="navbar">
		<!--  <a href="Home.jsp">Home</a> 
		<a href="quiz.jsp">Quiz</a>
		 <a href="results.jsp">Results</a> 
		 <a href="contact.jsp">Contact Us</a>
		  <a href="login.jsp" style="float: right;">Login</a> -->
		   <a href="admin_login.jsp" style="float: right" ;  class="active">Admin</a>
	</div>

	<div class="container">
		<h1>Login</h1>
		<form action="LoginServlet" method="post">
			<div class="form-group">
				<label for="roll_number">User Name:</label> <input type="text"
					id="username" name="username" placeholder="Enter your username">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" placeholder="Enter your password">
			</div>
			<div class="form-group">
				<button type="submit">Login</button>
			</div>
			<div class="form-group">
				<button type="button" onclick="window.location.href='register.jsp'">Don't
					have an Account? Click here to register</button>
			</div>

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
