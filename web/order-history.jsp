<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Orders</title>
    <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <!-- Linking Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/homepage.css" />
    <style>
#footer {
            position: fixed;
            padding: 5px;
            bottom: 0;
            width: 100%;

        }

/* Modal styles */
      .modal {
        display: none; 
        position: fixed; 
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.7);
        padding-top: 60px;
      }
      .modal-content {
        background-color: #fff;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 700px;
      }
      .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }
      .close:hover,
      .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
      }
        .container {
            width: 800px;
            margin: 0 auto;

            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding-top: 130px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: black;
        }
        /* Responsive Styles */
        @media (max-width: 700px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }

            .container {
                padding-top: 20px;
                padding-left: 10px;
            }
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
    </main>
  <div class="container">
    <h2>Order History</h2>

    <% 
        // Check if user is logged in by checking session
        String uid = (String) session.getAttribute("uid");
        
        if (uid == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("login.jsp");
        } else {
    %>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Movie Name</th>
                <th>Show Time</th>
                <th>Seats Booked</th>
                <th>Total Cost</th>
                <th>Transaction ID</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve order history from the database

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");

                    // Updated query to pull data from the new table structure
                    String query = "SELECT o.order_id, o.movie_name, o.show_time, o.selected_seats, o.total_cost, o.transaction_id, o.order_date " +
                                   "FROM order_history o WHERE o.user_id = ? ORDER BY o.order_id DESC";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, Integer.parseInt(uid));  // Assuming userId is stored in session

                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String orderId = rs.getString("order_id");
                        String movieName = rs.getString("movie_name");
                        String showTime = rs.getString("show_time");
                        String selectedSeats = rs.getString("selected_seats");
                        double totalCost = rs.getDouble("total_cost");
                        String transactionId = rs.getString("transaction_id");
                        String orderDate = rs.getString("order_date");

            %>
            <tr>
                <td><%= orderId %></td>
                <td><%= movieName %></td>
                <td><%= showTime %></td>
                <td><%= selectedSeats %></td>
                <td>Rs.<%= totalCost %></td>
                <td><%= transactionId %></td>
                <td><%= orderDate %></td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

    <% } %>

</div>
    <jsp:include page="footer.jsp" />
    
    <script src="homepage.js"></script>
</html>