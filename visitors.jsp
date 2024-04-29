<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
  // Retrieve the current session
  HttpSession session = request.getSession(true);
  
  // Retrieve the counter value from the session
  Integer count = (Integer)session.getAttribute("visitCount");
  
  // If the counter doesn't exist, initialize it to 1
  if (count == null) {
    count = 1;
  } else {
    // Otherwise, increment the counter
    count++;
  }
  
  // Store the updated counter value back in the session
  session.setAttribute("visitCount", count);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Visitor Counter</title>
</head>
<body>
  <h1>Welcome to Our Website!</h1>
  <p>This website has been visited <%= count %> times.</p>
</body>
</html>
