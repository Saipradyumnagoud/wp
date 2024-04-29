<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visitor Counter</title>
</head>
<body>
    <h1>Welcome to Our Website!</h1>
    <% 
        // Retrieve the current count from session
        Integer count = (Integer) session.getAttribute("visitCount");
        
        // If count is null, set it to 1, else increment
        if (count == null) {
            count = 1;
        } else {
            count++;
        }
        
        // Store the updated count in session
        session.setAttribute("visitCount", count);
    %>
    <p>This website has been visited <%= count %> times.</p>
</body>
</html>
