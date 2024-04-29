<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Table</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Employee Table</h1>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Salary</th>
                <th>Department</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                // Define database connection details
                String url = "jdbc:mysql://localhost:3306/employee";
                String username = "root";
                String password = "";
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection connection = DriverManager.getConnection(url, username, password);
                
                String query = "SELECT * FROM Employee";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(query);
                
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    double salary = resultSet.getDouble("salary");
                    String department = resultSet.getString("department");
                    
                    // Output table row for each employee
                    out.println("<tr>");
                    out.println("<td>" + id + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + salary + "</td>");
                    out.println("<td>" + department + "</td>");
                    out.println("</tr>");
                }
                
                // Close resources
                resultSet.close();
                statement.close();
                connection.close();
                
            } catch (Exception e) {
                // Print error message if an exception occurs
                out.println("Error: " + e.getMessage());
            }
            %>
        </tbody>
    </table>
</body>
</html>
