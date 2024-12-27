<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <script src="https://www.paypal.com/sdk/js?client-id=ARGKvbVL-ReF2TPWmA_xWdmd2qZXG-2vJUPVA33H06nsmB3SKci5SJtES6WSXICDu6I1T7PUfjmiANIy&components=buttons"></script> <!-- Replace with your Sandbox client ID -->
        <link rel="stylesheet" href="css/homepage.css" />
         <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <style>
.container {

  border: 3px solid green;
}

.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
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
            <a href="about.jsp" class="nav-link">About us</a>
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
    <button  id="menu-open-button" class="fas fa-bars"><p style="font-size: smaller"></button>
  </nav>
</header>
    <main>
        <h1>Review Your Payment</h1>
        
        <% 
            // Session check to ensure the user is logged in

            if (session == null || session.getAttribute("uname") == null) {
                response.sendRedirect("login.jsp");
                return; // Stop further processing if not logged in
            }
            
            // Fetching parameters from the request
            String movieName = request.getParameter("movieName");
            String movieDateTime = request.getParameter("movieDateTime");
            String selectedSeats = request.getParameter("selectedSeats");
            String totalCost = request.getParameter("totalCost");
            String movieId = request.getParameter("movieId");
            String uid = request.getParameter("uid");
        %>



        <div class="container">
  <div class="center">
      <div style="text-align: center">
        <h2>Movie Name: <%= movieName %></h2>
        <h2>Show Time: <%= movieDateTime %></h2>
        <h3>Selected Seats: <%= selectedSeats %></h3>
        <h3>Total Cost: Rs. <%= totalCost %></h3> <br>
        </div>
        <!-- PayPal Button -->
        <div id="paypal-button-container"></div>
   </div>
</div>    

        <form action="payment_success.jsp" method="POST" id="paymentForm">
            <input type="hidden" name="uid" value="<%= uid %>">
            <input type="hidden" name="movieId" value="<%= movieId %>">
            <input type="hidden" name="movieName" value="<%= movieName %>">
            <input type="hidden" name="movieDateTime" value="<%= movieDateTime %>">
            <input type="hidden" name="selectedSeats" value="<%= selectedSeats %>">
            <input type="hidden" name="totalCost" value="<%= totalCost %>">
            <input type="hidden" name="transactionId" id="transactionIdInput">
            <input type="hidden" name="payerName" id="payerNameInput">
            <input type="hidden" name="payerEmail" id="payerEmailInput">
            <input type="hidden" name="payerPhone" id="payerPhoneInput">
        </form>
            
    </main>

    <script>
        // PayPal Button configuration
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= totalCost %>' // Total cost from JSP
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Capture transaction details
                    var transactionId = details.id;
                    var payerName = details.payer.name.given_name;
                    var payerEmail = details.payer.email_address;
                    var payerPhone = details.payer.phone;

                    // Populate hidden fields with PayPal details
                    document.getElementById('transactionIdInput').value = transactionId;
                    document.getElementById('payerNameInput').value = payerName;
                    document.getElementById('payerEmailInput').value = payerEmail;
                    document.getElementById('payerPhoneInput').value = payerPhone;

                    // Submit the form to the server for order processing
                    document.getElementById('paymentForm').submit();
                });
            },
            onError: function(err) {
                alert('An error occurred during the payment process.');
                console.error(err);
            }
        }).render('#paypal-button-container');
    </script>
      <!-- Linking Swiper script -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="homepage.js"></script>

</body>
</html>
