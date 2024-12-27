<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reviews</title>
    <link rel="stylesheet" href="css/homepage.css" />

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="css/swiper-bundle.min.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="css/reviews.css" />
    

    <!-- Boxicons CSS -->
    <link
      href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
      rel="stylesheet"
    />
    
    <style>
      /* General Logo Style */
      .nav-logo .logo-text {
        font-size: 24px;
        color: #333;
        text-decoration: none;
        text-align: center; /* Center align the text for both desktop and mobile */
        display: inline-block; /* Make the logo text a block element for easier centering */
        width: 100%;
      }

      /* Mobile View Adjustments */
      @media (max-width: 768px) {
        .nav-logo .logo-text {
          font-size: 18px; /* Make it smaller on mobile */
          color: #00bff;  /* Change the color to blue */
          cursor: pointer; /* Indicate it's clickable */
          text-decoration: underline; /* Underline to signify it's a button */
        }

        /* Center the "Back to Home" text */
        .nav-logo .logo-text::after {
          content: "Back to Home"; /* Replace text with "Back to Home" */
          display: block; 
          width: 100%; 
          text-align: center; 
          visibility: visible;
          position: relative;
          padding-left: 77px;
        }

        /* Hide original text and show the new text */
        .nav-logo .logo-text {
          visibility: hidden;
        }

        .nav-logo .logo-text::after {
          visibility: visible;
        }
      }
      /* button CSS */
.button-92 {

  --c: #fff;

  /* text color */
  background: linear-gradient(90deg, #0000 33%, #fff5, #0000 67%) var(--_p,100%)/300% no-repeat,
    #004dff;
  /* background color */
  color: #0000;
  border: none;
  transform: perspective(500px) rotateY(calc(20deg*var(--_i,-1)));
  text-shadow: calc(var(--_i,-1)* 0.08em) -.01em 0   var(--c),
    calc(var(--_i,-1)*-0.08em)  .01em 2px #0004;
  outline-offset: .1em;
  transition: 0.3s;
}

.button-92:hover,
.button-92:focus-visible {
  --_p: 0%;
  --_i: 1;
}

.button-92:active {
  text-shadow: none;
  color: var(--c);
  box-shadow: inset 0 0 9e9q #0005;
  transition: 0s;

}

.button-92 {

  font-weight: bold;
  font-size: 2rem;
  margin: 0;
  cursor: pointer;
  padding: .1em .3em;

}

        
    </style>

  </head>
  <body>
    <header>
      <nav class="navbar">
          <div class="bhome">
        <a href="index.jsp" class="nav-logo">
          <h2 class="logo-text">SriCine</h2>
        </a> </div>
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

    <section class="container">
        <div class="testimonial mySwiper" style="padding-top: 120px">
        <div class="testi-content swiper-wrapper">
          
          <%
          try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");
            String Query = "SELECT * FROM feedback";
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(Query);
                        
            while (rs.next()) {
              // Extract feedback 
              String name = rs.getString("name");
              String Email = rs.getString("Email");
              String comments = rs.getString("comments");
          %>  
          <div class="slide swiper-slide">
            <img src="images/user.gif" alt="" class="image" />
            <p><%= comments %></p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name"><%= name %></span>
              <span class="job"><%= Email %></span>
            </div>
          </div>
          <%
          }
          } catch (Exception ex) {
            out.print("Exception: " + ex.getMessage());
            ex.printStackTrace();
          }
          %>
        </div> 
        
        <!-- write review button !-->
        <a href="feedback.jsp"><div style="text-align: center; padding-top: 35px">
<button class="button-92" role="button">Write a review</button>
</div></a>

        
        
      </div>
      <div class="swiper-button-next nav-btn"></div>
      <div class="swiper-button-prev nav-btn"></div>
      <div class="swiper-pagination"></div>
    </div>
  </section>

  <!-- Swiper JS -->
  <script src="js/swiper-bundle.min.js"></script>

  <!-- JavaScript -->
  <script src="js/reviews.js"></script>
  <!-- Linking Swiper script -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  <!-- Linking custom script -->
  <script src="homepage.js"></script>
</body>
<footer>
<footer class="footer-section">
    <div class="footer-content">
        <p style="text-align: center">&copy; 2025 SriCine. All rights reserved.</p>
    </div>
  </footer>
</footer>
</html>
