package cinema.user.registration;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.ResultSet;

@WebServlet(name = "RegistrationServlet", urlPatterns = {"/Register"})
public class RegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String uemail = request.getParameter("email");
        String upswd = request.getParameter("pswd");
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");

            // Check if email already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE uemail=?");
            checkStmt.setString(1, uemail);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Email already exists
                request.setAttribute("status", "emailExists");
                dispatcher = request.getRequestDispatcher("login.jsp");
            } else {
                // Insert new user
                PreparedStatement pst = con.prepareStatement("INSERT INTO users (uname, uemail, upwd) VALUES (?, ?, ?)");
                pst.setString(1, uname);
                pst.setString(2, uemail);
                pst.setString(3, upswd);
                int result = pst.executeUpdate();

                if (result > 0) {
                    // Successful signup
                    request.setAttribute("status", "signupSuccess");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                } else {
                    // Failed signup
                    request.setAttribute("status", "signupFailed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
            }

            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}