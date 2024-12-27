<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Seat Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/homepage.css" />
 <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <style>
        
/*screen */
.container {
  perspective: 1000px;
  margin-bottom: 3px;
}
.row {
  display: flex;
}
.screen {
  background-color: #fff;
  height: 70px;
  width: 100%;
  margin: 15px 0;
  transform: rotateX(-45deg);
  box-shadow: 0 3px 10px rgba(255, 255, 255, 0.7);
}
p.text {
  margin: 5px 0;
}
p.text span {
  color: #6feaf6;
}

  
       
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #0e0d16;
        }
        main {
            margin: 2rem;
            text-align: center;
        }
        .seating-section {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;

        }
        .section {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }

        .section .grid {
        margin-bottom: -70px;
}
        
        .grid {
            display: grid;
            grid-template-columns: repeat(8, 40px);
            grid-template-rows: repeat(4, 40px);
            gap: 10px;
            margin-top: 1rem;

        }
        .seat-wrapper {
            position: relative;
        }
        .seat {
            width: 40px;
            height: 40px;
            border-radius: 5px;
            background-color: gray;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .seat.selected {
            background-color: orange;
        }
        .seat:hover {
            background-color: blue;
        }
        .seat.unavailable {
            background-color: red;
            pointer-events: none;
        }
        .seat-number {
            position: absolute;
            font-size: 12px;
            color: white;
            font-weight: bold;
        }
        .checkoutBtn {
              --green: #1BFD9C;
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--green);
  background: linear-gradient(to right, rgba(27, 253, 156, 0.1) 1%, transparent 40%,transparent 60% , rgba(27, 253, 156, 0.1) 100%);
  color: var(--green);
  box-shadow: inset 0 0 10px rgba(27, 253, 156, 0.4), 0 0 9px 3px rgba(27, 253, 156, 0.1);
        }
        .checkoutBtn:hover{
            color: #82ffc9;
  box-shadow: inset 0 0 10px rgba(27, 253, 156, 0.6), 0 0 9px 3px rgba(27, 253, 156, 0.2);
        }
        checkoutBtn:before {
  content: "";
  position: absolute;
  left: -4em;
  width: 4em;
  height: 100%;
  top: 0;
  transition: transform .4s ease-in-out;
  background: linear-gradient(to right, transparent 1%, rgba(27, 253, 156, 0.1) 40%,rgba(27, 253, 156, 0.1) 60% , transparent 100%);
}
.chec:hover:before {
  transform: translateX(15em);
}
        .checkoutBtn:disabled {
cursor: not-allowed;
 --green: #f25012;
  font-size: 15px;
  padding: 0.7em 2.7em;
  letter-spacing: 0.06em;
  position: relative;
  font-family: inherit;
  border-radius: 0.6em;
  overflow: hidden;
  transition: all 0.3s;
  line-height: 1.4em;
  border: 2px solid var(--green);
  background: linear-gradient(
    to right,
    rgba(243, 78, 22, 0.1) 1%,
    transparent 40%,
    transparent 60%,
    rgba(243, 78, 22, 0.1) 100%
  );
  color: var(--green);
  box-shadow:
    inset 0 0 10px rgba(243, 78, 22, 0.4),
    0 0 9px 3px rgba(243, 78, 22, 0.1);
            
        }
        #summary {
            margin-top: 100px;
        }
        
    </style>
</head>
<body>
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
    String movieId = request.getParameter("id");
    String movieDate = request.getParameter("date");
    String movieTime = request.getParameter("time");
    String movieName = request.getParameter("name");
    String uid = request.getParameter("uid");

    String dbUrl = "jdbc:mysql://localhost:3306/cinema_abc";
    String dbUsername = "root";
    String dbPassword = "admin";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<String> bookedSeats = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        String query = "SELECT seat_number FROM seats WHERE movie_id = ? AND show_time = ? AND status = 'booked'";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, Integer.parseInt(movieId));
        stmt.setString(2, movieDate + " " + movieTime);
        rs = stmt.executeQuery();

        while (rs.next()) {
            bookedSeats.add(rs.getString("seat_number"));
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<main>
    <div class="seating-section">
        <!-- Left Side Section -->
        <div id="left-side" class="section">
            <h2 style="color: white">Left Side</h2>
            <div class="grid" id="leftGrid">
                <% for (int i = 1; i <= 32; i++) {
                    String seatId = "L-" + i;
                    boolean isBooked = bookedSeats.contains(seatId);
                %>
                <div class="seat-wrapper" id="<%= seatId %>" 
                     <% if (!isBooked) { %> onclick="toggleSeat(this, '<%= seatId %>')" <% } %>>
                    <div class="seat <%= isBooked ? "unavailable" : "" %>">
                        <span class="seat-number"><%= seatId %></span>
                    </div>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Right Side Section -->
        <div id="right-side" class="section">
            <h2 style="color: white">Right Side</h2>
            <div class="grid" id="rightGrid">
                <% for (int i = 1; i <= 32; i++) {
                    String seatId = "R-" + i;
                    boolean isBooked = bookedSeats.contains(seatId);
                %>
                <div class="seat-wrapper" id="<%= seatId %>" 
                     <% if (!isBooked) { %> onclick="toggleSeat(this, '<%= seatId %>')" <% } %>>
                    <div class="seat <%= isBooked ? "unavailable" : "" %>">
                        <span class="seat-number"><%= seatId %></span>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

            
            

    <div id="summary">
        
        <!-- SCREENN --> 
      <div class="container">
      <div class="screen"></div>
      <div class="row"></div>
 

        <h3 style="color: white">Movie Name: <span id="movieName"><%= movieName %></span></h3>
        <p style="color: white">Show Time: <span id="movieDateTime"><%= movieDate %> | <%= movieTime %></span></p>
        <p style="color: white">Selected Ticket Count: <span id="ticketCount">0</span></p>
        <p style="color: white">1 ticket price: Rs. 1100</p>
        <p style="color: white">Total Cost: Rs. <span id="totalCost">0</span></p>
        <p style="color: white">Selected Seat Numbers: <span id="seatNo">0</span></p>
    </div>
<br>

    <!-- Checkout Button -->
    <form action="review_payment.jsp" method="post" id="paymentForm">
        <input type="hidden" name="movieId" id="movieIdInput" value="<%= movieId %>">     
        <input type="hidden" name="movieName" id="movieNameInput" value="<%= movieName %>">
        <input type="hidden" name="movieDateTime" id="movieDateTimeInput" value="<%= movieDate %> <%= movieTime %>">
        <input type="hidden" name="selectedSeats" id="selectedSeatsInput">
        <input type="hidden" name="totalCost" id="totalCostInput">

         <input type="hidden" name="uid" id="uidInput" value="<%= uid %>">
        
         <button class="checkoutBtn" type="submit" id="checkoutBtn" disabled>Checkout</button>
    </form>
</main>
  
  <!-- Linking Swiper script -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Linking custom script -->
    <script src="homepage.js"></script>
    
<script>
    let seatPrice = 1100; // Rs. per seat
    let selectedSeats = [];

    function toggleSeat(seatElement, seatId) {
        const seat = seatElement.querySelector('.seat');
        if (seat.classList.contains('selected')) {
            seat.classList.remove('selected');
            selectedSeats = selectedSeats.filter(seat => seat !== seatId);
        } else {
            seat.classList.add('selected');
            selectedSeats.push(seatId);
        }
        updateSummary();
    }

    function updateSummary() {
        const ticketCount = selectedSeats.length;
        const totalCost = ticketCount * seatPrice;
        document.getElementById('ticketCount').innerText = ticketCount;
        document.getElementById('totalCost').innerText = totalCost;
        document.getElementById('seatNo').innerText = selectedSeats.join(', ');
        document.getElementById('checkoutBtn').disabled = ticketCount === 0;
    }

    function checkout() {
        if (selectedSeats.length === 0) {
            alert("Please select at least one seat.");
            return;
        }

        // Update hidden input fields with selected seats and total cost
        document.getElementById('selectedSeatsInput').value = selectedSeats.join(', ');
        const ticketCount = selectedSeats.length;
        const totalCost = ticketCount * seatPrice;
        document.getElementById('totalCostInput').value = totalCost;

        // Submit the form to the server
        document.getElementById('paymentForm').submit();
    }

    // Attach the checkout function to the button
    document.getElementById('checkoutBtn').addEventListener('click', checkout);
</script>

</body>
</html>
