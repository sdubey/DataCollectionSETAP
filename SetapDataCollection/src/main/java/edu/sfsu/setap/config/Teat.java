package edu.sfsu.setap.config;

import javax.mail.internet.MimeMessage.RecipientType;

import org.codemonkey.simplejavamail.Email;
import org.codemonkey.simplejavamail.Mailer;

public class Teat {

	public static void main(String[] args) {
	
		final Email email = new Email();

		email.setFromAddress("lollypop", "sonal2404@gmail.com");
		email.setSubject("hey");
		email.addRecipient("C. Cane", "sdubey@mail.sfsu.edu", RecipientType.TO);
		email.addRecipient("C. Bo", "m.sonaldubey@gmail.com", RecipientType.BCC);
		email.setText("We should meet up! ;)");
		email.setTextHTML("<img src='cid:wink1'><b>We should meet up!</b><img src='cid:wink2'>");
		
		new Mailer("smtp.gmail.com", 25, "username", "password").sendMail(email);
		
		
	}

}
