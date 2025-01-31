<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h2>Calculator</h2>
<form method="post" action="calculator.jsp">
    <input type="text" name="num1" placeholder="Enter first number" required>
    <select name="operation" required>
        <option value="">Select Operation</option>
        <option value="add">Add</option>
        <option value="subtract">Subtract</option>
        <option value="multiply">Multiply</option>
        <option value="divide">Divide</option>
    </select>
    <input type="text" name="num2" placeholder="Enter second number" required>
    <input type="submit" value="Calculate">
</form>

<%
    // Getting the parameters from the form
    String num1Str = request.getParameter("num1");
    String num2Str = request.getParameter("num2");
    String operation = request.getParameter("operation");

    if (num1Str != null && num2Str != null && operation != null) {
        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            double result = 0;

            switch (operation) {
                case "add":
                    result = num1 + num2;
                    break;
                case "subtract":
                    result = num1 - num2;
                    break;
                case "multiply":
                    result = num1 * num2;
                    break;
                case "divide":
                    if (num2 != 0) {
                        result = num1 / num2;
                    } else {
                        out.println("<p>Cannot divide by zero.</p>");
                    }
                    break;
                default:
                    out.println("<p>Invalid operation.</p>");
            }

            // Display the result
            out.println("<h3>Result: " + result + "</h3>");
        } catch (NumberFormatException e) {
            out.println("<p>Please enter valid numbers.</p>");
        }
    }
%>
</body>
</html>
