package mvc;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // ���� Ŭ������ ������������ �˸��� ������̼�
@EnableWebMvc
//������̼� ����� SpringMVC�� ������ �� �ʿ��� Bean �������� �ڵ����� ���ִ� ������̼� 
@ComponentScan("com.korea.team")
//@Component������̼� �� stereotype(@Service, @Repository, @Controller)������̼���
//�ο��� Ŭ�������� �ڵ����� ��ĵ�Ͽ� Bean���� ������ִ� ������ �ϴ� ������̼�
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}


	 
	 
}
