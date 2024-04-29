<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert N Records into Employee Table</title>
</head>
<body>
    <h1>Insert N Records into Employee Table</h1>
    
    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/employee";
        String username = "root";
        String password = "";
        
        // Number of records to insert
        int N = 10; // Change this to the desired number of records
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(url, username, password);
            
            // Prepare SQL statement with placeholders
            String sql = "INSERT INTO Employee (name, salary, department) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            
            // Insert N records
            for (int i = 1; i <= N; i++) {
                // Set values for parameters
                preparedStatement.setString(1, "Employee " + i);
                preparedStatement.setDouble(2, 50000.00); // Sample salary
                preparedStatement.setString(3, "Department " + i); // Sample department
                
                // Execute the prepared statement
                preparedStatement.executeUpdate();
            }
            
            // Close resources
            preparedStatement.close();
            connection.close();
            
            // Display success message
            out.println("<p>" + N + " records inserted into Employee table successfully!</p>");
            
        } catch (Exception e) {
            // Display error message if an exception occurs
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
