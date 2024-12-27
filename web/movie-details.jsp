<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String movieId = request.getParameter("id");
    String name = "";
    String imageUrl = "";
    String description = "";
    String language = "";
    int duration = 0;
    String genre = "";
    String cast = "";
    String trailer = "";
    Date showDate = null;
    Time showTime = null;

    // Fetch the movie details from the database using the movie ID
    if (movieId != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();  // Load MySQL driver
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");  // Establish DB connection
            String query = "SELECT * FROM movies WHERE id = ?";  // SQL query to get movie details by id
            PreparedStatement stmt = conn.prepareStatement(query);  // Prepare statement
            stmt.setInt(1, Integer.parseInt(movieId));  // Set the movie id in the query
            ResultSet rs = stmt.executeQuery();  // Execute the query

            if (rs.next()) {
                name = rs.getString("name");
                imageUrl = rs.getString("image_url");
                description = rs.getString("description");
                language = rs.getString("language");
                duration = rs.getInt("duration");
                genre = rs.getString("genre");
                cast = rs.getString("cast");
                trailer = rs.getString("trailer");
                showDate = rs.getDate("show_date");
                showTime = rs.getTime("show_time");
            }
        } catch (Exception ex) {
            out.print("Exception: " + ex.getMessage());  // Handle any exceptions that occur
            ex.printStackTrace();  // Print stack trace for debugging
        }
    } else {
        out.print("Movie not found.");
    }
%>

<!DOCTYPE html>
  <head>
    <title>SriCine Cinema</title>
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <!-- Linking Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/movie-details.css" />
    <style>
        /* trailer btn */
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

    <section class="hero-section">
      <div class="section-content">
        <div class="hero-details">
          <h1><%= name %></h1>
          <p class="description">
            <li><b>Overview: </b><%= description %></li>
            <li><b>Language: </b><%= language %></li>
            <li><b>Duration: </b><%= duration %> MINS</li>
            <li><b>Genre: </b><%= genre %></li>
            <li><b>Cast: </b><%= cast %></li>
            <li><b>Show Date: </b><%= showDate %></li>
            <li><b>Show Time: </b><%= showTime %></li>
          </p>

<!-- trailer Buttons -->
          <div style="text-align: center; margin-top: 20px;">         
<button id="watch-trailer-btn" class="button-85" role="button">
   Watch Trailer
</button>


              
 <!-- time Buttons -->
            <button style="background: transparent; border: 2px solid #fff; color: #fff; padding: 10px 20px; font-size: 1.1rem; font-weight: 600; border-radius: 30px; cursor: pointer; margin: 10px; transition: background-color 0.3s ease, color 0.3s ease;">
              <a href="seats.jsp?uid=<%= session.getAttribute("uid") %>&id=<%= movieId %>&name=<%= name %>&date=<%= showDate %>&time=<%= showTime %>"><%= showTime %></a>
            </button>
            
            
            
</div>
</div>
            
        
        <div class="hero-image-wrapper">
          <img src="<%= imageUrl %>" alt="<%= name %>" class="hero-image" />
        </div>
      </div>
    </section>

    <!-- Modal for YouTube Video -->
    <div id="video-modal" class="modal">
      <div class="modal-content">
        <span class="close">&times;</span>
        <iframe id="video-frame" width="100%" height="400" src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      </div>
    </div>

    <!-- Linking Swiper script -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- Linking custom script -->
    <script src="js/movie-details.js"></script>

    <!-- Script for Modal functionality -->
    <script>
      // Get the modal and button
      var modal = document.getElementById("video-modal");
      var btn = document.getElementById("watch-trailer-btn");
      var span = document.getElementsByClassName("close")[0];

      // When the user clicks the button, open the modal and load the video
      btn.onclick = function() {
        modal.style.display = "block";
        var videoUrl = "<%= trailer %>"; // Use the movie's trailer URL from the database
        document.getElementById("video-frame").src = videoUrl;
      }

      // When the user clicks on the close button, close the modal
      span.onclick = function() {
        modal.style.display = "none";
        document.getElementById("video-frame").src = ""; // Stop the video when closed
      }

      // When the user clicks outside the modal, close it
      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = "none";
          document.getElementById("video-frame").src = ""; // Stop the video when closed
        }
      }
    </script>
<footer class="footer-section">
    <div class="footer-content">
        <p style="text-align: center">&copy; 2025 SriCine. All rights reserved.</p>
    </div>
  </footer>
  </body>
</html>
