package context;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

@Configuration
@Component
public class MailAuthConfiguration {
	
	@Bean(name = "mailSender")
	public JavaMailSender getJavaMailSender() {
		Properties p = new Properties();
		p.put("mail.smtp.auth", true);
		p.put("mail.transport.protocol", "smtp");
		p.put("mail.smtp.starttls.enable", true);
		p.put("mail.smtp.starttls.required", true);
		p.put("mail.debug", true);
		p.put("mail.smtp.ssl.protocols","TLSv1.2");
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("rhwldbs0330@gmail.com");
		mailSender.setPassword("sexhzncidfwdsgqs");
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(p);
		
		return mailSender;
	}
}
