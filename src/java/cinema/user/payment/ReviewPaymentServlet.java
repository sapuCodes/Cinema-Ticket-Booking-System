package cinema.user.payment;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import cinema.user.payment.PaymentServices;


@WebServlet(name = "ReviewPaymentServlet", urlPatterns = {"/review_payment"})
public class ReviewPaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch payment details passed from PayPal
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        if (paymentId == null || payerId == null) {
            response.getWriter().write("Missing paymentId or PayerID.");
            return;
        }

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment paymentDetails = paymentServices.getPaymentDetails(paymentId);

            // Store payment details in request scope to show on the review page
            request.setAttribute("paymentDetails", paymentDetails);
            request.setAttribute("payerId", payerId);

            // Forward to review_payment.jsp
            request.getRequestDispatcher("/review_payment.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().write("Error retrieving payment details: " + ex.getMessage());
        }
    }
}
