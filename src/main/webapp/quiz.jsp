<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Quiz</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/quiz.css"> 
</head>
<body>
    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp">Contact Us</a>
        <a href="login.jsp" style="float: right;">Login</a>
    </div>

    <div class="container">
        <h1>Quiz</h1>
        <p>Select a quiz to start:</p>

        <form action="QuizQuestions.jsp" method="get">
            <label for="quizSelect">Choose a quiz:</label>
            <select id="quizSelect" name="quizId">
                <option value="">--Select a Quiz--</option>
                <% 
                    String url = "jdbc:mysql://localhost:3306/onlinequizsystem"; // Replace with your database URL
                    String user = "root"; // Database username
                    String password = "root"; // Database password

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);

                        String sql = "SELECT DISTINCT quiz_id, quiz_name FROM questions"; // Modify table and column names as needed
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String quizId = rs.getString("quiz_id");
                            String quizName = rs.getString("quiz_name");
                %>
                            <option value="<%= quizId %>"><%= quizName %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Clean up JDBC resources
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </select>
            <button type="submit">Take Quiz !..</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Online Quiz System. All rights reserved. <span class="heart">&#10084;</span></p>
    </footer>

</body>
</html>
