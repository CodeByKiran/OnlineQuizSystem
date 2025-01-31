
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
   <!-- Link to external CSS file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adlogin.css">
</head>
<body>

    <div class="navbar">
        <a href="Home.jsp">Home</a>
        <a href="quiz.jsp">Quiz</a>
        <a href="results.jsp">Results</a>
        <a href="contact.jsp">Contact Us</a>
        <!-- <a href="admin_dashboard.jsp" style="float:right;" class="active">Admin Dashboard</a> -->
        <a href=logout style="float:right;">Logout</a>
    </div>

    <div class="container">
        <h1>Admin Dashboard</h1>

 
        <section class="upload-questions">
            <h2>Upload Quiz Questions (CSV)</h2>
            <form action="UploadQuestionsServlet" method="post" enctype="multipart/form-data">
                <label for="file">Choose CSV file:</label>
                <input type="file" name="file" id="file" accept=".csv" required>
                <br><br>
                <button type="submit">Upload</button>
            </form>
        </section>

      

</body>
</html>
