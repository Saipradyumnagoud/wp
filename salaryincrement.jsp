
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enhance Salaries of Employees</title>
</head>
<body>
    <h1>Enhance Salaries of Employees</h1>
    
    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/employee";
        String username = "root";
        String password = "";
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(url, username, password);
            
            // Prepare SQL call for the stored procedure
            String sql = "{CALL enhanceSalaries()}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            
            // Execute the stored procedure
            callableStatement.execute();
            
            // Close resources
            callableStatement.close();
            connection.close();
            
            // Display success message
            out.println("<p>Salaries of employees enhanced successfully!</p>");
            
        } catch (Exception e) {
            // Display error message if an exception occurs
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>



DELIMITER //

CREATE PROCEDURE enhanceSalaries()
BEGIN
    UPDATE Employee
    SET salary = salary * 1.1
    WHERE salary > 5000;
END //

DELIMITER ;
