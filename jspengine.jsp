<!DOCTYPE html>
<html>
<head>
    <title>Hello JSP</title>
</head>
<body>
    <h1>Hello, JSP!</h1>
    <p>This is a simple JSP page.</p>
    <%
        // Example of embedding Java code in JSP
        String message = "Welcome to JSP!";
        out.println("<p>" + message + "</p>");
    %>
</body>
</html>
