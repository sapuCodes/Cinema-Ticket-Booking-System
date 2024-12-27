<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    String selectedSeats = (String) session.getAttribute("selectedSeats");
    String totalCost = (String) session.getAttribute("totalCost");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
</head>
<body>
    <h1>Payment Successful!</h1>
    <h2>Your Selected Seats: <%= selectedSeats %></h2>
    <h3>Total Cost: Rs. <%= totalCost %></h3>
</body>
</html>
