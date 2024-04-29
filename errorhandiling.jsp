
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Handling Example</title>
</head>
<body>
    <h1>Error Handling Example</h1>
    <% 
        try {
            // Some code that may throw an exception
            int result = 10 / 0; // This will throw an ArithmeticException
        } catch (ArithmeticException e) {
            // Handle the exception
    %>
            <p>An error occurred: <%= e.getMessage() %></p>
    <% 
        }
    %>
</body>
</html>
