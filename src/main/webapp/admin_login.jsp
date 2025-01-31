<!-- login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Quiz System - Login</title>
<!-- Link to external CSS file -->
<!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adlogin1.css">
</head>
<body>
   <!-- <div class="navbar">
        <a href="admin_login.jsp" style="float: right;" class="active">Admin</a>
    </div> -->

    <div class="container">
        <h1>Admin Login</h1>
        <%
            String error = request.getParameter("error");
            if ("invalid_credentials".equals(error)) {
        %>
            <div class="error-message" style="color: red;">Invalid username or password. Please try again.</div>
        <%
            }
        %>
        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
            
        </form>
    </div>
    <footer>
        <p>
            &copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span>
        </p>
    </footer>
</body>
</html>
