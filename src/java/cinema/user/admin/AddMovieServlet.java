package cinema.user.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddMovieServlet", urlPatterns = {"/AddMovieServlet"})
public class AddMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String imageUrl = request.getParameter("imageUrl");
        String description = request.getParameter("description");
        String language = request.getParameter("language");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String genre = request.getParameter("genre");
        String cast = request.getParameter("cast");
        String trailer = request.getParameter("trailer");
        String showDate = request.getParameter("showDate");
        String showTime = request.getParameter("showTime");

        // Combine showDate and showTime into a DATETIME format
        String formattedShowTime = showDate + " " + showTime + ":00";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");

            // Insert the movie into the movies table
            String insertMovieQuery = "INSERT INTO movies (name, image_url, description, language, duration, genre, cast, trailer, show_date, show_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertMovieQuery, PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, name);
            pstmt.setString(2, imageUrl);
            pstmt.setString(3, description);
            pstmt.setString(4, language);
            pstmt.setInt(5, duration);
            pstmt.setString(6, genre);
            pstmt.setString(7, cast);
            pstmt.setString(8, trailer);
            pstmt.setString(9, showDate);
            pstmt.setString(10, formattedShowTime);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Get the generated movie ID
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int movieId = generatedKeys.getInt(1);

                    // Insert seats for this movie
                    insertSeats(conn, movieId, formattedShowTime);
                }

                // Redirect to the movie list page
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().print("Error adding movie.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Exception: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to insert seats for a movie
    private void insertSeats(Connection conn, int movieId, String showTime) throws SQLException {
        String insertSeatQuery = "INSERT INTO seats (movie_id, show_time, seat_number, status) VALUES (?, ?, ?, ?)";
        int seatsPerSection = 32; // Left and Right sections each have 32 seats

        try (PreparedStatement seatStmt = conn.prepareStatement(insertSeatQuery)) {
            // Insert seats for the Left side (L-1 to L-32)
            for (int i = 1; i <= seatsPerSection; i++) {
                String seatNumber = "L-" + i;
                seatStmt.setInt(1, movieId);
                seatStmt.setString(2, showTime);
                seatStmt.setString(3, seatNumber);
                seatStmt.setString(4, "available"); // Default status is "available"
                seatStmt.addBatch();
            }

            // Insert seats for the Right side (R-1 to R-32)
            for (int i = 1; i <= seatsPerSection; i++) {
                String seatNumber = "R-" + i;
                seatStmt.setInt(1, movieId);
                seatStmt.setString(2, showTime);
                seatStmt.setString(3, seatNumber);
                seatStmt.setString(4, "available"); // Default status is "available"
                seatStmt.addBatch();
            }

            seatStmt.executeBatch(); // Execute the batch to insert all seats at once
        }
    }
}
