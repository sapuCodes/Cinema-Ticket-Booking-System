package cinema.user.payment;

import java.util.*;
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;


public class PaymentServices {
    private static final String CLIENT_ID = "ARGKvbVL-ReF2TPWmA_xWdmd2qZXG-2vJUPVA33H06nsmB3SKci5SJtES6WSXICDu6I1T7PUfjmiANIy";
    private static final String CLIENT_SECRET = "EFmIVJJCK0fpeR9eE5H4rX0sUCF11A4GipeXVLG4xpxbaRxb3NwRfczVynN5hePeAnEHmTryTEJMttkK";
    private static final String MODE = "sandbox";
    
    public String authorizePayment(OrderDetail orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
        
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
        
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Payment approvedPayment = requestPayment.create(apiContext);
        
        return getApprovalLink(approvedPayment);
    }
    
    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

    Payment payment = new Payment();
    payment.setId(paymentId);

    PaymentExecution paymentExecution = new PaymentExecution();
    paymentExecution.setPayerId(payerId);

    return payment.execute(apiContext, paymentExecution); // Executes the payment
}
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    return Payment.get(apiContext, paymentId);
}

    
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        return payer;
    }
    
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:3000/CinemaABC/cancel.html");
        redirectUrls.setReturnUrl("http://localhost:3000/CinemaABC/execute_payment");
        return redirectUrls;
    }
    
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
        Transaction transaction = new Transaction();
        transaction.setAmount(new Amount("USD", orderDetail.getTotal()));
        transaction.setDescription("Cinema Seat Booking");
        
        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);
        return transactions;
    }
    
    private String getApprovalLink(Payment approvedPayment) {
        for (Links link : approvedPayment.getLinks()) {
            if (link.getRel().equals("approval_url")) {
                return link.getHref();
            }
        }
        return null;
    }
}
