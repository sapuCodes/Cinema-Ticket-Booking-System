package cinema.user.reviews;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SubmitFeedback")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");
        String Email = request.getParameter("Email");

        try {
            // Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");

            // SQL query to insert feedback
            String query = "INSERT INTO feedback (name, rating, comments, Email) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, name);
            pst.setInt(2, rating);
            pst.setString(3, comments);
            pst.setString(4, Email);

            // Execute the query
            pst.executeUpdate();
            
            // Redirect to a confirmation page or feedback list page
            response.sendRedirect("thankYou.jsp"); // or a page where feedback is displayed
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error saving feedback.");
        }
    }
}
