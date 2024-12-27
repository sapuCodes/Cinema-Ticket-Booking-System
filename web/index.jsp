<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="images/sricine.ico" type="image/icon type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SriCine Cinema</title>
    <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <!-- Linking Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/homepage.css" />
    <style>
        /* contact form btn */ 
.button {
  --black-700: hsla(0 0% 12% / 1);
  --border_radius: 9999px;
  --transtion: 0.3s ease-in-out;
  --offset: 2px;

  cursor: pointer;
  position: relative;

  display: flex;
  align-items: center;
  gap: 0.5rem;

  transform-origin: center;

  padding: 1rem 2rem;
  background-color: transparent;

  border: none;
  border-radius: var(--border_radius);
  transform: scale(calc(1 + (var(--active, 0) * 0.1)));

  transition: transform var(--transtion);
}

.button::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  width: 100%;
  height: 100%;
  background-color: var(--black-700);

  border-radius: var(--border_radius);
  box-shadow: inset 0 0.5px hsl(0, 0%, 100%), inset 0 -1px 2px 0 hsl(0, 0%, 0%),
    0px 4px 10px -4px hsla(0 0% 0% / calc(1 - var(--active, 0))),
    0 0 0 calc(var(--active, 0) * 0.375rem) hsl(260 97% 50% / 0.75);

  transition: all var(--transtion);
  z-index: 0;
}

.button::after {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  width: 100%;
  height: 100%;
  background-color: hsla(260 97% 61% / 0.75);
  background-image: radial-gradient(
      at 51% 89%,
      hsla(266, 45%, 74%, 1) 0px,
      transparent 50%
    ),
    radial-gradient(at 100% 100%, hsla(266, 36%, 60%, 1) 0px, transparent 50%),
    radial-gradient(at 22% 91%, hsla(266, 36%, 60%, 1) 0px, transparent 50%);
  background-position: top;

  opacity: var(--active, 0);
  border-radius: var(--border_radius);
  transition: opacity var(--transtion);
  z-index: 2;
}

.button:is(:hover, :focus-visible) {
  --active: 1;
}
.button:active {
  transform: scale(1);
}

.button .dots_border {
  --size_border: calc(100% + 2px);

  overflow: hidden;

  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  width: var(--size_border);
  height: var(--size_border);
  background-color: transparent;

  border-radius: var(--border_radius);
  z-index: -10;
}

.button .dots_border::before {
  content: "";
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
  transform-origin: left;
  transform: rotate(0deg);

  width: 100%;
  height: 2rem;
  background-color: white;

  mask: linear-gradient(transparent 0%, white 120%);
  animation: rotate 2s linear infinite;
}

@keyframes rotate {
  to {
    transform: rotate(360deg);
  }
}

.button .sparkle {
  position: relative;
  z-index: 10;

  width: 1.75rem;
}

.button .sparkle .path {
  fill: currentColor;
  stroke: currentColor;

  transform-origin: center;

  color: hsl(0, 0%, 100%);
}

.button:is(:hover, :focus) .sparkle .path {
  animation: path 1.5s linear 0.5s infinite;
}

.button .sparkle .path:nth-child(1) {
  --scale_path_1: 1.2;
}
.button .sparkle .path:nth-child(2) {
  --scale_path_2: 1.2;
}
.button .sparkle .path:nth-child(3) {
  --scale_path_3: 1.2;
}

@keyframes path {
  0%,
  34%,
  71%,
  100% {
    transform: scale(1);
  }
  17% {
    transform: scale(var(--scale_path_1, 1));
  }
  49% {
    transform: scale(var(--scale_path_2, 1));
  }
  83% {
    transform: scale(var(--scale_path_3, 1));
  }
}

.button .text_button {
  position: relative;
  z-index: 10;

  background-image: linear-gradient(
    90deg,
    hsla(0 0% 100% / 1) 0%,
    hsla(0 0% 100% / var(--active, 0)) 120%
  );
  background-clip: text;

  font-size: 1rem;
  color: transparent;
}

    </style>
  </head>
  <body>
      <jsp:include page="loadingAnimation.jsp" />
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
            <a href="#" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
            <a href="#menu" class="nav-link">Now Showing</a>
        </li>
        <li class="nav-item">
            <a href="#testimonials" class="nav-link">Coming Soon</a>
        </li>
        <li class="nav-item">
            <a href="#contact" class="nav-link">Contact</a>
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


    <main>
      <!-- Hero section -->
      <section style="background-image: url('cover.jpg');" class="hero-section">
        <div class="section-content">
          <div class="hero-details">
           
            <h3 class="subtitle">🎥 "Find the Perfect Movie, Perfect Seats, Every Time!"</h3>
          
           
          </div>
          <div class="hero-image-wrapper">
            <img src="images/logo.gif" alt="logo" class="hero-image" />
          </div>
        </div>
      </section>
      

      
      <!-- Now Showing -->
      
     <section class="menu-section" id="menu">
    <h2 class="section-title">NOW SHOWING</h2>
    <div class="section-content">
        <ul class="menu-list">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");
                    String Query = "SELECT * FROM movies";
                    Statement stm = conn.createStatement();
                    ResultSet rs = stm.executeQuery(Query);
                    
                    while (rs.next()) {
                        // Extract movie details
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String imageUrl = rs.getString("image_url");
                        String genre = rs.getString("genre");
            %>
            <li class="menu-item">
                <a href="movie-details.jsp?id=<%= id %>&uid=<%= session.getAttribute("uid") %>">
                    <img src="<%= imageUrl %>" alt="<%= name %>" class="menu-image" />
                </a>
                <div class="menu-details">
                    <h3 class="name"><%= name %></h3>
                    <p class="description"><%= genre %></p>
                </div>
            </li>
            <%
                    }
                } catch (Exception ex) {
                    out.print("Exception: " + ex.getMessage());
                    ex.printStackTrace();
                }
            %>
        </ul>
    </div>
</section>



      <!--ComingSoon -->
      <section class="testimonials-section" id="testimonials">
        <h2 class="section-title">Coming Soon</h2>
        <div class="section-content">
          <div class="slider-container swiper">
            <div class="slider-wrapper">
              <ul class="testimonials-list swiper-wrapper">
                  
                  <%
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");
                    String Query = "SELECT * FROM coming_soon";
                    Statement stm = conn.createStatement();
                    ResultSet rs = stm.executeQuery(Query);
                    
                    while (rs.next()) {
                        // Extract movie details
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String imageUrl = rs.getString("image_url");
            %>
                  
                  
                <li class="testimonial swiper-slide">
                  <img src="<%= imageUrl %>" alt="User" class="user-image" />
                  <h3 class="name"><%= name %></h3>
                </li>
                
                
                
                <%
                    }
                } catch (Exception ex) {
                    out.print("Exception: " + ex.getMessage());
                    ex.printStackTrace();
                }
            %>
              

              <div class="swiper-pagination"></div>
              <div class="swiper-slide-button swiper-button-prev"></div>
              <div class="swiper-slide-button swiper-button-next"></div>
            </div>
          </div>
        </div>
      </section>

     

      <!-- Contact section -->
      <section class="contact-section" id="contact">
        <h2 class="section-title">Contact Us</h2>
        <div class="section-content">
          <ul class="contact-info-list">
            <li class="contact-info">
              <i class="fa-solid fa-location-crosshairs"></i>
              <p>123 Campsite Avenue, Colombo 5, Sri Lanka</p>
            </li>
            <li class="contact-info">
              <i class="fa-regular fa-envelope"></i>
              <p>info@SriCine.com</p>
            </li>
            <li class="contact-info">
              <i class="fa-solid fa-phone"></i>
              <p>077-1588426</p>
            </li>
            <li class="contact-info">
              <i class="fa-regular fa-clock"></i>
              <p>Monday - Sunday: 11:00 AM - 11:00 PM</p>
            </li>
            <li class="contact-info">
              <i class="fa-regular fa-clock"></i>
              <p>PoyaDay: Closed</p>
            </li>
            <li class="contact-info">
              <i class="fa-solid fa-globe"></i>
              <p>www.SriCine.com</p>
            </li>
          </ul>

          <form action="https://api.web3forms.com/submit" method="POST"  class="contact-form"> <!-- outsourcing handling to web3forms -->
              <input type="hidden" name="access_key" value="f303e998-a9e7-4b3e-a47f-040a56faed75">
              <input type="checkbox" name="botcheck" class="hidden" style="display: none;"> <!<!-- Spam Protection -->
            <input type="text" name="name" placeholder="Your name" class="form-input" required />
            <input type="email" name="email" placeholder="Your email" class="form-input" required />
            <textarea placeholder="Your message"  name="message" class="form-input" required></textarea>

            <button type="submit" class="button submit-button">
            <div class="dots_border"></div>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    fill="none"
    viewBox="0 0 24 24"
    class="sparkle"
  >
    <path
      class="path"
      stroke-linejoin="round"
      stroke-linecap="round"
      stroke="black"
      fill="black"
      d="M14.187 8.096L15 5.25L15.813 8.096C16.0231 8.83114 16.4171 9.50062 16.9577 10.0413C17.4984 10.5819 18.1679 10.9759 18.903 11.186L21.75 12L18.904 12.813C18.1689 13.0231 17.4994 13.4171 16.9587 13.9577C16.4181 14.4984 16.0241 15.1679 15.814 15.903L15 18.75L14.187 15.904C13.9769 15.1689 13.5829 14.4994 13.0423 13.9587C12.5016 13.4181 11.8321 13.0241 11.097 12.814L8.25 12L11.096 11.187C11.8311 10.9769 12.5006 10.5829 13.0413 10.0423C13.5819 9.50162 13.9759 8.83214 14.186 8.097L14.187 8.096Z"
    ></path>
    <path
      class="path"
      stroke-linejoin="round"
      stroke-linecap="round"
      stroke="black"
      fill="black"
      d="M6 14.25L5.741 15.285C5.59267 15.8785 5.28579 16.4206 4.85319 16.8532C4.42059 17.2858 3.87853 17.5927 3.285 17.741L2.25 18L3.285 18.259C3.87853 18.4073 4.42059 18.7142 4.85319 19.1468C5.28579 19.5794 5.59267 20.1215 5.741 20.715L6 21.75L6.259 20.715C6.40725 20.1216 6.71398 19.5796 7.14639 19.147C7.5788 18.7144 8.12065 18.4075 8.714 18.259L9.75 18L8.714 17.741C8.12065 17.5925 7.5788 17.2856 7.14639 16.853C6.71398 16.4204 6.40725 15.8784 6.259 15.285L6 14.25Z"
    ></path>
    <path
      class="path"
      stroke-linejoin="round"
      stroke-linecap="round"
      stroke="black"
      fill="black"
      d="M6.5 4L6.303 4.5915C6.24777 4.75718 6.15472 4.90774 6.03123 5.03123C5.90774 5.15472 5.75718 5.24777 5.5915 5.303L5 5.5L5.5915 5.697C5.75718 5.75223 5.90774 5.84528 6.03123 5.96877C6.15472 6.09226 6.24777 6.24282 6.303 6.4085L6.5 7L6.697 6.4085C6.75223 6.24282 6.84528 6.09226 6.96877 5.96877C7.09226 5.84528 7.24282 5.75223 7.4085 5.697L8 5.5L7.4085 5.303C7.24282 5.24777 7.09226 5.15472 6.96877 5.03123C6.84528 4.90774 6.75223 4.75718 6.697 4.5915L6.5 4Z"
    ></path>
  </svg>
  <span class="text_button">Send Message</span>     
            </button>
          </form>
        </div>
      </section>

    </main>

         
    
        <jsp:include page="footer.jsp" />
    
</html>