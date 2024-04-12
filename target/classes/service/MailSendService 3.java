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
		System.out.println("������ȣ : " + checkNum);
		authcode = checkNum;
	}
	
	
	public String m_email_authcode(String m_email) {
		randomNum();
		String setFrom = "rhwldbs0330@gmail.com";
		String toMail = m_email;
		String title = "��й�ȣ �缳�� ���� ��ȣ�Դϴ�.";
		String content =
				"Ȩ�������� �湮���ּż� �����մϴ�."+
				"<br><br>"+
				"���� ��ȣ�� " + authcode + "�Դϴ�."+
				"<br>" +
				"�ش� ���� ��ȣ�� ���� ��ȣ Ȯ�ζ��� �����Ͽ� �ּ���";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authcode);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		
		// true �Ű����� �����ϸ� multipart ������ �޼��� ������ ����, ���� ���ڵ� ������ �����ϴ�.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); // true�� �������� ������ �ܼ� �ؽ�Ʈ�� ����
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO: handle exception
		}
	}
}
