package cinema.user.payment;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Add this import for PayPalRESTException
import com.paypal.base.rest.PayPalRESTException;

@WebServlet(name = "AuthorizePaymentServlet", urlPatterns = {"/authorize_payment"})
public class AuthorizePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String totalStr = request.getParameter("totalCost"); // Correct parameter name
        float total = Float.parseFloat(totalStr); // Convert string to float

        OrderDetail orderDetail = new OrderDetail(total);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Invalid Payment Details");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            // Optionally, handle exception and show user-friendly message
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Payment authorization failed.");
        }
    }
}
