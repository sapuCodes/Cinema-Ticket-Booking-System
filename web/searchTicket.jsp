<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Transaction</title>
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2 class="mt-5">Search Ticket by Transaction ID</h2>
    <form method="post" action="searchTicket.jsp">
        <div class="mb-3">
            <label for="transactionId" class="form-label">Transaction ID:</label>
            <input type="text" class="form-control" id="transactionId" name="transactionId" required>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <%
    // Check if transactionId is submitted
    String transactionId = request.getParameter("transactionId");
    if (transactionId != null && !transactionId.isEmpty()) {
        String dbUrl = "jdbc:mysql://localhost:3306/cinema_abc";
        String dbUsername = "root";
        String dbPassword = "admin";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Query to get ticket details for the provided transactionId
            String query = "SELECT email, seat_number, show_time, movie_id FROM seats WHERE transaction_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, transactionId);

            rs = stmt.executeQuery();

            // Variable to store seat numbers and user details
            List<String> seatNumbers = new ArrayList<>();
            String userEmail = "";
            String showTime = "";
            String movieId = "";

            // Loop through the result set to collect all seat numbers for the transaction
            while (rs.next()) {
                if (userEmail.isEmpty()) {
                    userEmail = rs.getString("email");
                    showTime = rs.getString("show_time");
                    movieId = rs.getString("movie_id"); // Store the movie_id
                }
                // Add each seat number to the list
                seatNumbers.add(rs.getString("seat_number"));
            }

            if (!seatNumbers.isEmpty()) {
    %>
                <div class="alert alert-success mt-4">
                    <strong>Valid Ticket Found!</strong><br>
                    <strong>User Email:</strong> <%= userEmail %><br>
                    <strong>Seats Booked:</strong> <%= String.join(", ", seatNumbers) %><br>
                    <strong>Show Time:</strong> <%= showTime %><br>
                    <strong>Movie ID:</strong> <%= movieId %><br>
                </div>
    <%
            } else {
                // If no ticket found, show a message
    %>
                <div class="alert alert-danger mt-4">
                    <strong>Ticket Not Valid!</strong>
                </div>
    <%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger mt-4'>Error retrieving ticket details. Please try again.</div>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
