package service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authcode;
	
	public void randomNum() {
		Random rnd = new Random();
		int checkNum = rnd.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authcode = checkNum;
	}
	
	
	public String m_email_authcode(String m_email) {
		randomNum();
		String setFrom = "rhwldbs0330@gmail.com";
		String toMail = m_email;
		String title = "비밀번호 재설정 인증 번호입니다.";
		String content =
				"홈페이지를 방문해주셔서 감사합니다."+
				"<br><br>"+
				"인증 번호는 " + authcode + "입니다."+
				"<br>" +
				"해당 인증 번호를 인증 번호 확인란에 기입하여 주세요";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authcode);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능, 문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); // true로 전달하지 않으면 단순 텍스트로 전달
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO: handle exception
		}
	}
}
