<%@page import="cinema.user.payment.EmailService"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SriCine</title>
    <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <!-- Linking Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/homepage.css" />
    <style>
        ._failed { border-bottom: solid 4px red !important; }
        ._failed i { color: red !important; }

        ._success {
            box-shadow: 0 15px 25px #00000019;
            width: 100%;
            text-align: center;
            padding-top: 100px;
        }

        ._success i {
            font-size: 55px;
            color: #28a745;
        }

        ._success h2 {
            margin-bottom: 12px;
            font-size: 40px;
            font-weight: 500;
            line-height: 1.2;
            margin-top: 10px;
        }

        ._success p {
            margin-bottom: 0px;
            font-size: 18px;
            color: #bebebe;
            font-weight: 500;
        }


/* CSS button*/
.button-85 {
  padding: 0.6em 2em;
  border: none;
  outline: none;
  color: rgb(255, 255, 255);
  background: #111;
  cursor: pointer;
  position: relative;
  z-index: 0;
  border-radius: 10px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-85:before {
  content: "";
  background: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
  position: absolute;
  top: -2px;
  left: -2px;
  background-size: 400%;
  z-index: -1;
  filter: blur(5px);
  -webkit-filter: blur(5px);
  width: calc(100% + 4px);
  height: calc(100% + 4px);
  animation: glowing-button-85 20s linear infinite;
  transition: opacity 0.3s ease-in-out;
  border-radius: 10px;
}

@keyframes glowing-button-85 {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 400% 0;
  }
  100% {
    background-position: 0 0;
  }
}

.button-85:after {
  z-index: -1;
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: #222;
  left: 0;
  top: 0;
  border-radius: 10px;
}
        
    </style>
  </head>
  <body>
    <!-- Header / Navbar -->
    <header>
  <nav class="navbar">
    <a href="index.jsp" class="nav-logo">
      <h2 class="logo-text">SriCine</h2>
    </a>
    <div class="snowflakes" aria-hidden="true">
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
        <div class="snowflake">❄️</div>
    </div>
    
     <ul class="nav-menu">
        <button id="menu-close-button" class="fas fa-times"></button>
        <li class="nav-item">
            <a href="index.jsp" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
            <a href="index.jsp#menu" class="nav-link">Now Showing</a>
        </li>
        <li class="nav-item">
            <a href="index.jsp#testimonials" class="nav-link">Coming Soon</a>
        </li>
        <li class="nav-item">
            <a href="index.jsp#contact" class="nav-link">Contact</a>
        </li>
        <li class="nav-item">
            <a href="aboutus.jsp" class="nav-link">About us</a>
        </li>

        <!-- Display user name or Guest if not logged in -->
        <li class="nav-item">
            <a href="#" class="nav-link user-name">
                <%= session.getAttribute("uname") != null ? session.getAttribute("uname") : "Guest" %>
            </a>
        </li>

        <!-- Conditionally display Order History and Login/Logout based on user session -->
        <% if (session.getAttribute("uname") != null) { %>  <!-- User is logged in -->
            <li class="nav-item">
                <a href="order-history.jsp" class="nav-link orders">Order History</a>
            </li>
            <li class="nav-item">
                <a href="Logout" class="nav-link logout">Logout</a>
            </li>
        <% } else { %>  <!-- User is not logged in -->
            <li class="nav-item">
                <a href="login.jsp" class="nav-link login">Login</a>
            </li>
        <% } %>
    </ul>
    <button id="menu-open-button" class="fas fa-bars"></button>
  </nav>
</header>

    <%
    String selectedSeats = request.getParameter("selectedSeats");
    String totalCost = request.getParameter("totalCost");
    String transactionId = request.getParameter("transactionId");
    String movieName = request.getParameter("movieName");
    String movieDateTime = request.getParameter("movieDateTime");
    String movieId = request.getParameter("movieId");
    String payerName = request.getParameter("payerName");
    String payerEmail = request.getParameter("payerEmail");
    String uid = (String) session.getAttribute("uid"); // 

    EmailService.sendConfirmationEmail(payerEmail, payerName, transactionId, movieName, totalCost, selectedSeats, movieDateTime);
    %>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="message-box _success">
                    <i class="fa fa-check-circle" aria-hidden="true"></i>
                    <h2>Payment Successful</h2>
                    <p>Thank you for your payment.<br>Your seats have been booked!</p><br>
                    <ul>

                        <li style="color: green">State: Order Confirmed!</li>
                        <li>Transaction ID: <%= transactionId %></li>
                        <li>Movie: <%= movieName %></li>
                        <li>Show: <%= movieDateTime %></li>
                        <li>Seats: <%= selectedSeats %></li>
                        <li>Amount Paid: Rs.<%= totalCost %>/-</li>
                        <li>Payer Name: <%= payerName %></li>
                        <li>Payer Email: <%= payerEmail %></li>
                    </ul> <br>
                    <p style="font-size: small">Order Confirmation Email has been sent to your email.<br>
                        (The one provided in PayPal payment details)<br>
                        <span style="color: red">Keep a screenshot of this or Confirmation Email for entrance.</span>
                    </p><br>
                    <p style="color: blue">**No Refund. No Cancellation. No outside food and drinks are allowed inside the cinema.</p>
                        <br>
                        </div><div style="text-align: center">
                    <a href="order-history.jsp"> <button class="button-85" role="button">See your order</button></a>
                        </div>

                
            </div>
        </div>
    </div> 

    <%
    String showTime = request.getParameter("movieDateTime");
    String[] seatNumbers = selectedSeats.split(",");
    String dbUrl = "jdbc:mysql://localhost:3306/cinema_abc";
    String dbUsername = "root";
    String dbPassword = "admin";

    Connection conn = null;
    PreparedStatement seatStmt = null;
    PreparedStatement orderStmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // Update seats table
        String updateSeatsQuery = "UPDATE seats SET status = 'booked', transaction_id = ?, email = ? WHERE movie_id = ? AND seat_number = ? AND show_time = ?";
        for (String seatNumber : seatNumbers) {
            seatStmt = conn.prepareStatement(updateSeatsQuery);
            seatStmt.setString(1, transactionId);
            seatStmt.setString(2, payerEmail);
            seatStmt.setInt(3, Integer.parseInt(movieId));
            seatStmt.setString(4, seatNumber.trim());
            seatStmt.setString(5, showTime);

            seatStmt.executeUpdate();
        }

        // Insert into order_history table
        String insertOrderQuery = "INSERT INTO order_history (user_id, movie_id, movie_name, show_time, selected_seats, total_cost, transaction_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        orderStmt = conn.prepareStatement(insertOrderQuery);
        orderStmt.setInt(1, Integer.parseInt(uid));
        orderStmt.setInt(2, Integer.parseInt(movieId));
        orderStmt.setString(3, movieName);
        orderStmt.setString(4, movieDateTime);
        orderStmt.setString(5, selectedSeats);
        orderStmt.setBigDecimal(6, new java.math.BigDecimal(totalCost));
        orderStmt.setString(7, transactionId);

        orderStmt.executeUpdate();

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        System.out.println("Error processing payment: " + e.getMessage());
    } finally {
        try {
            if (seatStmt != null) seatStmt.close();
            if (orderStmt != null) orderStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>


  </body>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="homepage.js"></script>
    <!-- Bootstrap Bundle JS (includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
</html>