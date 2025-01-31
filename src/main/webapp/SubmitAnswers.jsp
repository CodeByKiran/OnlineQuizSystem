<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Debug Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Quiz Results</h1>

        <%
            String quizId = request.getParameter("quizId");
            //out.println("<p>Quiz ID: " + quizId + "</p>");

            String url = "jdbc:mysql://localhost:3306/onlinequizsystem"; // Replace with your database URL
            String user = "root"; // Database username
            String password = "root"; // Database password

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int score = 0;
            int totalQuestions = 0;
            Map<String, String> correctAnswers = new HashMap<>();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

               
                //out.println("<p>Database connection successful.</p>");

                // Fetch correct answers
                String sql = "SELECT question_id, correct_option FROM questions WHERE quiz_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, quizId);
                rs = pstmt.executeQuery();

                // Store correct answers in a map
                while (rs.next()) {
                    String questionId = rs.getString("question_id");
                    String correctAnswer = rs.getString("correct_option");
                    correctAnswers.put(questionId, correctAnswer);
                    totalQuestions++;
                }

                // Output correct answers for debugging
                out.println("<h2>Correct Answers:</h2>");
                for (Map.Entry<String, String> entry : correctAnswers.entrySet()) {
                    out.println("<p>Question ID: " + entry.getKey() + ", Correct Answer: " + entry.getValue() + "</p>");
                }

                // Evaluate user's answers
                for (String questionId : correctAnswers.keySet()) {
                    String userAnswer = request.getParameter("question_" + questionId);
                    if (userAnswer != null && userAnswer.equals(correctAnswers.get(questionId))) {
                        score++;
                    }
                }

                // Display results
                out.println("<p>Your score: " + score + " out of " + totalQuestions + "</p>");
                out.println("<p>Thank you for participating!</p>");
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace(new PrintWriter(out)); // Wrap `out` in `PrintWriter` for compatibility
            } finally {
                // Clean up JDBC resources
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>

        <a href="quiz.jsp" class="btn btn-primary">Take Another Quiz</a>
    </div>

    <footer>
        <p>&copy; 2024 Online Quiz System. All rights reserved.</p>
    </footer>
</body>
</html>
