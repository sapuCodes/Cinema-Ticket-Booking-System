<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro" rel="stylesheet">
       <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <link rel="stylesheet" href="css/homepage.css" />
    <style>


.wrapper-1{
  width:100%;
  height:100vh;
  display: flex;
    padding-top :200px;
flex-direction: column;
}
.wrapper-2{
  padding-top :100px;
  text-align:center;
}
h1{
    font-family: 'Kaushan Script', cursive;
  font-size:4em;
  letter-spacing:3px;
  color:#5892FF ;
  margin:0;
  margin-bottom:20px;
}
.wrapper-2 p{
  margin:0;
  font-size:1.3em;
  color:#aaa;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.go-home{
  color:#fff;
  background:#5892FF;
  border:none;
  padding:10px 50px;
  margin:30px 0;
  border-radius:30px;
  text-transform:capitalize;
  box-shadow: 0 10px 16px 1px rgba(174, 199, 251, 1);
}
.go-home:hover {
  background-color: #04AA6D;
  color: white;
}
.click:hover {
  background-color: #04AA6D;
  color: white;
}
.footer-like{
  margin-top: auto; 
  background:#D7E6FE;
  padding:6px;
  text-align:center;
}
.footer-like p{
  margin:0;
  padding:4px;
  color:#5892FF;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.footer-like p a{
  text-decoration:none;
  color:#5892FF;
  font-weight:600;
}

@media (min-width:360px){
  h1{
    font-size:4.5em;
  }
  .go-home{
    margin-bottom:20px;
  }
}

@media (min-width:600px){
  .content{
  max-width:1000px;
  margin:0 auto;
}
  .wrapper-1{
  height: initial;
  max-width:620px;
  margin:0 auto;
 
  box-shadow: 4px 8px 40px 8px rgba(88, 146, 255, 0.2);
}
  
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
    <button id="menu-open-button" class="fas fa-bars"><p style="font-size: smaller"></button>
  </nav>
</header>
    
    <div class=content>
  <div class="wrapper-1">
    <div class="wrapper-2">
      <h1>Thank you!</h1>
      <p>Thank You for Your Feedback!</p>
      <p>Your feedback has been submitted successfully.</p>
      <a href="index.jsp"><button class="go-home">
      Go Back to Home
          </button></a>
    </div>
    <div class="footer-like">
      <p>Want to see your feedback?
          <a class="click" href="reviews.jsp">Click here to see them</a>
      </p>
    </div>
</div>
</div>
    
</body>
      <!-- Linking Swiper script -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="homepage.js"></script>
</html>
