package config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import context.Context_1_dataSource;
import context.Context_2_mybatis;
import context.Context_3_dao;
import context.Context_4_fileupload;
import context.MailAuthConfiguration;
import mvc.Servlet_Context;
import service.Exception;
import service.MailSendService;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {


	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] {  Context_1_dataSource.class,
							  Context_2_mybatis.class,
							  Context_3_dao.class,
							  Context_4_fileupload.class,
							  MailAuthConfiguration.class,
							  Exception.class};
	}

	

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { Servlet_Context.class,MailSendService.class };
	}

	// getServletMappings
	// DispatcherServlet의 URL 패턴을 지정한다.
	// "/" : 모든 요청을 처리하겠다.

	@Override
	protected String[] getServletMappings() {

		return new String[] { "/" };
	}

	// filter
	// Client의 요청이 Servlet에 도달하기 전이나 후에 요청 및 응답 데이터를 변형하거나
	// 추가적인 작업을 수행하는데 사용되는 자바 컴포넌트

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		
		return new Filter[] {characterEncodingFilter};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		MultipartConfigElement multipartConfigElement
		= new MultipartConfigElement("c:\\upload",20971520,41943040,20971520);
		registration.setMultipartConfig(multipartConfigElement);
		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
	}
}
