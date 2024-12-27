package cinema.user.payment;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailService {

    public static void sendConfirmationEmail(String toEmail, String userName, String transactionId, String movieName, String movieDateTime, String selectedSeats, String totalCost) {
        // Set up the SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Your Gmail credentials
        final String username = "heysapu@gmail.com";
        final String password = "hsvhrgotdxlatrqv";

        // Create session and authenticate with the SMTP server
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Booking Confirmation");

            // Create the content of the email
            String emailContent = "<h3>We are SriCine Cinema. Thank you for your payment!</h3>" +
                                  "<p>Hello " + userName + ",</p>" +
                                  "<p>Your booking for the movie <b>" + movieName + "</b> has been confirmed.</p>" +
                                  "<ul>" +
                                  "<li>Transaction ID: " + transactionId + "</li>" +
                                  "<li>Show " + totalCost + "</li>" +
                                  "<li>Seats: " + selectedSeats + "</li>" +
                                  "<li>Total Amount Paid: Rs. " + movieDateTime + "/-"+ "</li>" +
                                  "</ul>" +
                                  "<p> **No Refund. No Cancellation. No outside food and drinks are allowed inside the cinema. </p>"+
                                  "<p>Enjoy the show!</p>";

            // Set the content of the email
            message.setContent(emailContent, "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Confirmation email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
