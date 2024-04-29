<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Username and Password Validation</title>
</head>
<body>
    <h1>Username and Password Validation</h1>
    
    <%
        // Define valid username and password
        String validUsername = "user123";
        String validPassword = "password123";
        
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validate username and password
        boolean isValid = false;
        if (username != null && password != null) {
            if (username.equals(validUsername) && password.equals(validPassword)) {
                isValid = true;
            }
        }
    %>
    
    <%-- Display validation result --%>
    <% if (isValid) { %>
        <p>Login successful. Welcome, <%= username %>!</p>
    <% } else { %>
        <p>Login failed. Invalid username or password.</p>
    <% } %>
    
    <%-- Form for entering username and password --%>
    <form method="post" action="jspvalidate.jsp">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username"><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br>
        
        <input type="submit" value="Login">
    </form>
</body>
</html>
