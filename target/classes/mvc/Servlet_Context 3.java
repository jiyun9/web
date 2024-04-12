package mvc;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // 현재 클래스가 설정파일임을 알리는 어노테이션
@EnableWebMvc
//어노테이션 기반의 SpringMVC를 구성할 때 필요한 Bean 설정들을 자동으로 해주는 어노테이션 
@ComponentScan("com.korea.team")
//@Component어노테이션 및 stereotype(@Service, @Repository, @Controller)어노테이션이
//부여된 클래스들을 자동으로 스캔하여 Bean으로 등록해주는 역할을 하는 어노테이션
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}


	 
	 
}
