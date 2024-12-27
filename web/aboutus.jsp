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
    <link rel="stylesheet" href="css/aboutus.css" />
    <style>
        .logoimg {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
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


  <!-- About Us Section -->
  <section class="about-us-section" id="about">
    <div class="about-header">
      <h2 class="section-title">Who We Are</h2>
      <p class="section-subtitle">🎬 The Ultimate Sri Lankan Movie Experience!</p>
    </div>

    <div class="about-content">
      <div class="text-content">
        <h3 class="about-title">- SriCine - 
        <p class="about-description">
         SriCine is committed to improving the quality of the cinematic experience in Sri Lanka by offering our guests the 
         elegance of vintage movie theatres along with cutting-edge comfort and sophistication that meet worldwide standards.
        </p>
        <div class="buttons">
          <a href="index.jsp" class="button menu-button">Back to Home</a>
        </div>
      </div>

      <div class="image-content">
        <img src="images/Fame Man Filmmaker Logo.jpeg" alt="About Us" class="about-image">
      </div>
        <p>We take pride in being in the forefront of Sri Lanka's film industry's development. In addition to importing and distributing 
      top-notch Hollywood, Bollywood, Tamil, Hindi, and Sinhala films, we are skilled in the construction and operation of cutting-edge luxury small 
      theatres. We ensure that every moviegoer enjoys the glitz and narrative as the filmmakers intended by bringing the majesty and wonder of international 
      cinema to Sri Lankan audiences.
We have more in mind than just movie screenings. We carefully choose our films to feature both popular local material and the newest Hollywood and 
Bollywood movies thanks to our solid studio relationships and in-depth knowledge of international film trends. Together with dynamic marketing
initiatives and a user-friendly electronic ticketing platform, we guarantee that every trip to SriCine Cinema is both smooth and remarkable.
</p>
<div class="logoimg"><img src="sricine.png" alt="logo"></div>
    </div>
        
  </section>

  <!-- Footer -->
  <footer class="footer-section">
    <div class="footer-content">
      <p>&copy; 2025 SriCine. All rights reserved.</p>
    </div>
  </footer>

  </body>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="homepage.js"></script>
    <script>
</html>