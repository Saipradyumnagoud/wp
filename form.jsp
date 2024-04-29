<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
</head>
<body>
    <h1>Login Form</h1>
    
    <form method="post" action="login.jsp">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
    
    <%-- Check username and password --%>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check if username and password are valid
        if (username != null && password != null && username.equals("admin") && password.equals("admin123")) {
    %>
            <p>Login successful! Welcome, <%= username %>!</p>
    <%
        } else if (username != null || password != null) {
    %>
            <p>Invalid username or password. Please try again.</p>
    <%
        }
    %>
</body>
</html>
