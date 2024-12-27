package cinema.user.payment;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ExecutePaymentServlet", urlPatterns = {"/execute_payment"})
public class ExecutePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve paymentId and payerId from the request
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        // Debug: Log the parameters received
        System.out.println("Payment ID: " + paymentId);
        System.out.println("Payer ID: " + payerId);

        // Check if paymentId or payerId are missing
        if (paymentId == null || payerId == null) {
            response.getWriter().write("Error: Missing paymentId or PayerID.");
            return;
        }

        try {
            // Execute the payment
            PaymentServices paymentServices = new PaymentServices();
            Payment executedPayment = paymentServices.executePayment(paymentId, payerId);

            // Debug: Log the executed payment details
            System.out.println("Executed Payment: " + executedPayment.toString());

            // Set payment details as a request attribute and forward to success page
            request.setAttribute("payment", executedPayment);
            request.getRequestDispatcher("/payment_success.jsp").forward(request, response);

        } catch (PayPalRESTException ex) {
            ex.printStackTrace();

            // Forward to an error page with detailed error information
            request.setAttribute("errorMessage", "Payment execution failed: " + ex.getMessage());
            request.getRequestDispatcher("/payment_error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate to doPost for handling GET requests
        doPost(request, response);
    }
}
