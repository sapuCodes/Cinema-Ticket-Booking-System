
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="images/sricine.ico" type="image/icon type">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>add movie</title>
  <style>
      @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Open Sans", sans-serif;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  width: 100%;
  padding: 0 10px;
}

body::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("https://www.codingnepalweb.com/demos/create-glassmorphism-login-form-html-css/hero-bg.jpg"), #000;
  background-position: center;
  background-size: cover;
}

.wrapper {
  width: 400px;
  border-radius: 8px;
  padding: 30px;
  text-align: center;
  border: 1px solid rgba(255, 255, 255, 0.5);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
}

form {

  flex-direction: column;
}

h2 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #ff4f;
}

.input-field {
  position: relative;
  border-bottom: 2px solid #ccc;
  margin: 15px 0;
}


button {
  background: #fff;
  color: #000;
  font-weight: 600;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  border-radius: 3px;
  font-size: 16px;
  border: 2px solid transparent;
  transition: 0.3s ease;
}

button:hover {
  color: #fff;
  border-color: #fff;
  background: rgba(255, 255, 255, 0.15);
}

.register {
  text-align: center;
  margin-top: 30px;
  color: #fff;
}
.textcol {
    color: whitesmoke;
}
  </style>
</head>
<body>
  <div class="wrapper">
    <h2>Add New Movie</h2>
    <form action="AddMovieServlet" method="POST" enctype="multipart/form-data">
        
        <label for="name" class="textcol">Movie Name:</label>
        <input type="text" id="name" name="name" class="input-field" required><br>

        <label for="imageUrl" class="textcol">Image URL:</label>
        <input type="text" id="imageUrl" name="imageUrl" class="input-field" required><br>

        <label for="description" class="textcol">Description:</label>
        <textarea id="description" name="description" class="input-field" required></textarea><br>

        <label for="language" class="textcol">Language:</label>
        <input type="text" id="language" name="language" class="input-field" required><br>

        <label for="duration" class="textcol">Duration (in minutes):</label>
        <input type="number" id="duration" name="duration" class="input-field" required><br>

        <label for="genre" class="textcol">Genre:</label>
        <input type="text" id="genre" name="genre" class="input-field" required><br>

        <label for="cast" class="textcol">Cast:</label>
        <input type="text" id="cast" name="cast" class="input-field" required><br>

        <label for="trailer" class="textcol">Trailer URL:</label>
        <input type="text" id="trailer" name="trailer" class="input-field" required><br>

        <label for="showDate" class="textcol">Show Date:</label>
        <input type="date" id="showDate" name="showDate" class="input-field" required><br>

        <label for="showTime" class="textcol">Show Time:</label>
        <input type="time" id="showTime" name="showTime" class="input-field" required><br>

      
        <button type="submit" value="Add Movie">Add Movie</button>
    </form>
  </div>
</body>
</html>