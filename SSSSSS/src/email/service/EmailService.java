package email.service;



import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import email.model.dao.EmailDAO;
import email.model.dto.EmailDTO;

public class EmailService {
	
	public void mailSender(EmailDTO dto,String birth_chk) throws MessagingException, UnsupportedEncodingException{
		String host = "smtp.gmail.com";
		String username = "ahn05142"; //@gmail.com
		String password = "51428313";
		int port = 587;
		
		EmailDAO dao = new EmailDAO();

        String fromName = dto.getFromName();
        String fromEmail = dto.getFromEmail();
//        String toEmail = dto.getToEmail();
        String subject = dto.getSubject();
        String content = dto.getContent();

        Properties props = System.getProperties(); //import java.util.Properties;
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        Session session = Session.getDefaultInstance(props, 
                new javax.mail.Authenticator() {
                    String un = username;
                    String pw = password;

                    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new javax.mail.PasswordAuthentication(un, pw);
                    }
                }
        );
        session.setDebug(true); //for debug
        Message mimeMessage = new MimeMessage(session); //MimeMessage 생성

        mimeMessage.addFrom(new InternetAddress[] {
                new InternetAddress(fromEmail, fromName)
        });
        List<EmailDTO> list = dao.getEmail(birth_chk);
        InternetAddress[] toEmail = new InternetAddress[list.size()];
        for(int i=0; i<list.size(); i++) {
        	toEmail[i] = new InternetAddress(list.get(i).getMemberEmail());
        }
        
        //수신자 .TO .CC(참조) .BCC(숨은참조) 
        mimeMessage.setRecipients(Message.RecipientType.TO,toEmail);
//		mimeMessage.setRecipient(Message.RecipientType.CC, new InternetAddress(toEmail));
//		mimeMessage.setRecipient(Message.RecipientType.BCC, new InternetAddress(toEmail));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(content);
        Transport.send(mimeMessage);
    }
	
}
