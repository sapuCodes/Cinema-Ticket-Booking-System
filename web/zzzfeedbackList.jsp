<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Feedback</title>
</head>
<body>
    <h2>Customer Feedback</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Rating</th>
            <th>Comments</th>
            <th>Feedback Date</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");
                String query = "SELECT * FROM feedback ORDER BY feedback_date DESC";
                Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery(query);
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("Email") %></td>
            <td><%= rs.getInt("rating") %></td>
            <td><%= rs.getString("comments") %></td>
            <td><%= rs.getTimestamp("feedback_date") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
