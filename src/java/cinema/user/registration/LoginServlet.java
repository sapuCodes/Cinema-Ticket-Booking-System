package cinema.user.registration;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uemail = request.getParameter("email");
        String upswd = request.getParameter("pswd");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema_abc", "root", "admin");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE uemail=? AND upwd=?");
            pst.setString(1, uemail);
            pst.setString(2, upswd);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // Successful login
                session.setAttribute("uname", rs.getString("uname"));
                session.setAttribute("uid", rs.getString("uid"));
                request.setAttribute("status", "loginSuccess");
                dispatcher = request.getRequestDispatcher("index.jsp"); // forward to the same page
            } else {
                // Failed login
                request.setAttribute("status", "loginFailed");
                dispatcher = request.getRequestDispatcher("login.jsp"); // forward to the same page
            }

            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
