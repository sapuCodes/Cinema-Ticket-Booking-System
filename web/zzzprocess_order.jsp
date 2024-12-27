<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>processing order</title>
    </head>
    <body>
<%
    String selectedSeats = request.getParameter("selectedSeats");
    String totalCost = request.getParameter("totalCost");

    // Process the order (store in the database, send confirmation, etc.)
    // This is just a placeholder for your actual order handling logic.

    out.println("Order Confirmed!");
    out.println("Seats: " + selectedSeats);
    out.println("Total Cost: Rs. " + totalCost);
%>


    </body>
</html>
