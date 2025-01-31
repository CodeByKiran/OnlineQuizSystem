<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="util.DBConnection" %>

<%
    // Retrieve quiz_id from request or session
    String quizId = request.getParameter("quizId");
    if (quizId == null) {
        quizId = (String) session.getAttribute("quizId");
    } else {
        session.setAttribute("quizId", quizId);
    }

    // Get the page parameter from the request for pagination control
    int pagelimit = 1; // Default to page 1
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        try {
            pagelimit = Integer.parseInt(pageParam);
            if (pagelimit < 1) pagelimit = 1; // Ensure page is at least 1
        } catch (NumberFormatException e) {
            pagelimit = 1; // Default to page 1 on error
        }
    }

    int questionsPerPage = 1; // Number of questions per page
    int totalPages = 1; // Default value for total pages

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    // Question variables
    String questionText = "";
    String optionA = "", optionB = "", optionC = "", optionD = "";
    int correctOption = 0;

    try {
        conn = DBConnection.getConnection();
        
        // Get total question count to calculate total pages
        String countSql = "SELECT COUNT(*) FROM questions WHERE quiz_id = ?";
        stmt = conn.prepareStatement(countSql);
        stmt.setString(1, quizId);
        rs = stmt.executeQuery();
        if (rs.next()) {
            int totalQuestions = rs.getInt(1);
            totalPages = (int) Math.ceil((double) totalQuestions / questionsPerPage);
        }
        
        // Retrieve the current question based on page number
        String sql = "SELECT * FROM questions WHERE quiz_id = ? LIMIT ?, ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, quizId);
        stmt.setInt(2, (pagelimit - 1) * questionsPerPage);
        stmt.setInt(3, questionsPerPage);
        rs = stmt.executeQuery();

        if (rs.next()) {
            questionText = rs.getString("question");
            optionA = rs.getString("option_A");
            optionB = rs.getString("option_B");
            optionC = rs.getString("option_C");
            optionD = rs.getString("option_D");
            correctOption = rs.getInt("correct_option");
        }
    } catch (SQLException e) {
        out.println("<p>Error retrieving quiz data. Please try again later.</p>");
        e.printStackTrace(); // Log for debugging
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>

<html>
<head>
    <title>Quiz Page</title>
</head>
<body>
    <h1>Quiz Page</h1>
    <form action="QuizPage.jsp?page=<%= pagelimit + 1 %>" method="POST">
        <h2>Question <%= pagelimit %> of <%= totalPages %></h2>
        <p><%= questionText %></p>
        <input type="radio" name="answer" value="1" required> <%= optionA %><br>
        <input type="radio" name="answer" value="2"> <%= optionB %><br>
        <input type="radio" name="answer" value="3"> <%= optionC %><br>
        <input type="radio" name="answer" value="4"> <%= optionD %><br>
        
        <%
            // Retrieve and validate the user's selected answer
            String selectedAnswer = request.getParameter("answer");
            boolean isCorrect = false;
            if (selectedAnswer != null) {
                try {
                    int answer = Integer.parseInt(selectedAnswer);
                    isCorrect = (answer == correctOption);
                    if (isCorrect) {
                        out.println("<p style='color: green;'>Correct answer!</p>");
                    } else {
                        out.println("<p style='color: red;'>Incorrect answer!</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p style='color: red;'>Invalid answer selected!</p>");
                }
            }
        %>

        <%
            // Display Next or Submit button based on the page number
            if (pagelimit < totalPages) {
        %>
            <input type="submit" value="Next Question">
        <%
            } else {
        %>
            <input type="submit" value="Submit Quiz">
        <%
            }
        %>
    </form>

    <%
        // Display navigation information
        if (totalPages > 1) {
            out.println("<p>Page " + pagelimit + " of " + totalPages + "</p>");
        }
    %>
</body>
</html>