<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System - Quiz Questions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Quiz Questions</h1>

        <form action="SubmitAnswers.jsp" method="post">
            <%
                String quizId = request.getParameter("quizId");
                String url = "jdbc:mysql://localhost:3306/onlinequizsystem"; // Replace with your database URL
                String user = "root"; // Database username
                String password = "root"; // Database password

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    // Fetch questions along with options
                    String sqlQuestions = "SELECT question_id, question, option_A, option_B, option_C, option_D FROM questions WHERE quiz_id = ?";
                    pstmt = conn.prepareStatement(sqlQuestions);
                    pstmt.setString(1, quizId);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String questionId = rs.getString("question_id");
                        String questionText = rs.getString("question");
                        String optionA = rs.getString("option_A");
                        String optionB = rs.getString("option_B");
                        String optionC = rs.getString("option_C");
                        String optionD = rs.getString("option_D");
            %>
                        <div class="form-group">
                            <label><%= questionText %></label>
                            <div>
                                <%
                                    // Display options if they are not null
                                    if (optionA != null) {
                                %>
                                        <input type="radio" name="question_<%= questionId %>" value="A"> <%= optionA %><br>
                                <%
                                    }
                                    if (optionB != null) {
                                %>
                                        <input type="radio" name="question_<%= questionId %>" value="B"> <%= optionB %><br>
                                <%
                                    }
                                    if (optionC != null) {
                                %>
                                        <input type="radio" name="question_<%= questionId %>" value="C"> <%= optionC %><br>
                                <%
                                    }
                                    if (optionD != null) {
                                %>
                                        <input type="radio" name="question_<%= questionId %>" value="D"> <%= optionD %><br>
                                <%
                                    }
                                %>
                            </div>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Clean up JDBC resources
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
            <button type="submit" class="btn btn-primary">Submit Answers</button>
            <input type="hidden" name="quizId" value="<%= quizId %>">
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Online Quiz System. All rights reserved.</p>
    </footer>
</body>
</html>