<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Register</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/register.css">
</head>
<body>
    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp">Contact Us</a>
        <a href="login.jsp" style="float:right;">Login</a>
        <a href="admin_login.jsp" style = "float:right";  class="active">Admin Login</a>
    </div>

    <div class="container">
    <h1>Register</h1>
    <form action="RegisterServlet" method="post">
        <table>
            <tr>
                <td><label for="roll_number">University Id:</label></td>
                <td><input type="text" id="roll_number" name="username" required></td>
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password" name="password" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Register">
                </td>
            </tr>
        </table>
    </form>

    <p><a href="login.jsp">Already have an account? Login here</a></p>
</div>
    

    <footer>
    <p>&copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span></p>
   </footer>
</body>
</html>
