<!DOCTYPE html>
<html>
<head>
    <title>Implicit Objects in JSP</title>
</head>
<body>
    <h1>Implicit Objects in JSP</h1>
    
    <%-- request implicit object --%>
    <p>Request Method: <%= request.getMethod() %></p>
    <p>Request URI: <%= request.getRequestURI() %></p>
    
    <%-- session implicit object --%>
    <% session.setAttribute("username", "JohnDoe"); %>
    <p>Session Attribute: <%= session.getAttribute("username") %></p>
    
    <%-- application implicit object --%>
    <% application.setAttribute("appName", "MyApp"); %>
    <p>Application Attribute: <%= application.getAttribute("appName") %></p>
    
    <%-- out implicit object --%>
    <% out.println("This is an output message."); %>
    
    <%-- pageContext implicit object --%>
    <p>JSP File Path: <%= pageContext.getServletContext().getRealPath("/") %></p>
</body>
</html>
