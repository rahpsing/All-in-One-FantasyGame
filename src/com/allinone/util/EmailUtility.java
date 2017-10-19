/**
 * 
 */
package com.allinone.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.chainsaw.Main;

/**
 * @author rahul
 *
 */
public class EmailUtility {
	
	public static void main(String[] args) {
		EmailUtility.sendEmail();
	}
	/**
	  * Send a single email.
	  */
	public static void sendEmail(){
	Session mailSession = createSmtpSession();
	mailSession.setDebug (true);

	try {
	    Transport transport = mailSession.getTransport ();

	    MimeMessage message = new MimeMessage (mailSession);

	    message.setSubject ("HTML  mail with images");
	    message.setFrom (new InternetAddress ("myJavaEmailSender@gmail.com"));
	    message.setContent ("<h1>Hello world</h1>", "text/html");
	    message.addRecipient (Message.RecipientType.TO, new InternetAddress ("rahultheowl.singh@gmail.com"));

	    transport.connect ();
	    transport.sendMessage (message, message.getRecipients (Message.RecipientType.TO));  
	}
	catch (MessagingException e) {
	    System.err.println("Cannot Send email");
	    e.printStackTrace();
	}
	}

	private static Session createSmtpSession() {
	final Properties props = new Properties();
	props.setProperty ("mail.host", "smtp.gmail.com");
	props.setProperty("mail.smtp.auth", "true");
	props.setProperty("mail.smtp.port", "465");
	props.setProperty("mail.smtp.starttls.enable", "true");
	 props.put("mail.smtp.socketFactory.port", "465");  
	props.setProperty ("mail.transport.protocol", "smtp");
	// props.setProperty("mail.debug", "true");

	return Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication("rahultheowl.singh@gmail.com", "freakmango92");
	  }
	});
	}


	 public static void sendEmail(String emailAddress, String userName) {
		 
			String to = emailAddress;
			String from = "admin@all-in-one.com";
			String host = "localhost";
			boolean debug = Boolean.valueOf("localhost").booleanValue();
			
			String msgText = new StringBuilder("Hello ").append(userName).append("\n").append("Thankyou for registering with ALL-IN-ONE FANTASY LEAGUE").toString();

			// create some properties and get the default Session
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			//if (debug) props.put("mail.debug", args[3]);

			Session session = Session.getInstance(props, null);
			session.setDebug(debug);
			
			try {
			    // create a message
			    MimeMessage msg = new MimeMessage(session);
			    msg.setFrom(new InternetAddress(from));
			    InternetAddress[] address = {new InternetAddress(to)};
			    msg.setRecipients(Message.RecipientType.TO, address);
			   // msg.setText(msgText, "utf-8");
			   // htmlPart.setContent( html, "text/html; charset=utf-8" );
			    
			    Multipart multipart = new MimeMultipart( "alternative" );

			  //  MimeBodyPart textPart = new MimeBodyPart();
			   // textPart.setText( text, "utf-8" );

			    MimeBodyPart htmlPart = new MimeBodyPart();
			    htmlPart.setContent( msgText, "text/html; charset=utf-8" );

			   // multipart.addBodyPart( textPart );
			    multipart.addBodyPart( htmlPart );
			    msg.setContent(multipart);
			   // msg.setContent(msgText, "text/html; charset=utf-8" );
			    msg.setSubject("New TERF Request");
			    msg.setSentDate(new Date());
			    // If the desired charset is known, you can use
			    // setText(text, charset)
			    msg.setText(msgText);
			    
			    Transport.send(msg);
			} catch (MessagingException mex) {
			    System.out.println("\n--Exception handling in msgsendsample.java");

			    mex.printStackTrace();
			    System.out.println();
			    Exception ex = mex;
			    do {
				if (ex instanceof SendFailedException) {
				    SendFailedException sfex = (SendFailedException)ex;
				    Address[] invalid = sfex.getInvalidAddresses();
				    if (invalid != null) {
					System.out.println("    ** Invalid Addresses");
					for (int i = 0; i < invalid.length; i++) 
					    System.out.println("         " + invalid[i]);
				    }
				    Address[] validUnsent = sfex.getValidUnsentAddresses();
				    if (validUnsent != null) {
					System.out.println("    ** ValidUnsent Addresses");
					for (int i = 0; i < validUnsent.length; i++) 
					    System.out.println("         "+validUnsent[i]);
				    }
				    Address[] validSent = sfex.getValidSentAddresses();
				    if (validSent != null) {
					System.out.println("    ** ValidSent Addresses");
					for (int i = 0; i < validSent.length; i++) 
					    System.out.println("         "+validSent[i]);
				    }
				}
				System.out.println();
				if (ex instanceof MessagingException)
				    ex = ((MessagingException)ex).getNextException();
				else
				    ex = null;
			    } while (ex != null);
			}
	 }
}
