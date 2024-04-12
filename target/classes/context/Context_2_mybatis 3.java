package context;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import lombok.RequiredArgsConstructor;


@Configuration
@RequiredArgsConstructor
public class Context_2_mybatis {
	
	final DataSource ds;
	
	//1. setterInjection
	
	//2. constructionInjection
	
	//SqlSessionFactoryBean�� �������� FactoryBean �������̽��� �����Ѵ�.
	//�� ������ �������� SqlSessionFactoryBean��ü�� �����Ѵ� ���� �ƴ϶�
	//Factory���� getObject()�޼��带 ȣ���� ����� �����Ѵٴ� �ǹ��̴�.
	//�� ��� �������� ���ø����̼� ���� ������ SqlSessionFactory�� �����ϰ�
	//sqlSessionFactory��� �̸����� �����Ѵ�.

	@Bean
	public SqlSessionFactory factoryBean() throws Exception{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		
		factoryBean.setDataSource(ds);
		
		factoryBean.setConfigLocation(new ClassPathResource("config/mybatis/mybatis-config.xml"));
		return factoryBean.getObject();
	}
	
	//Mybatis������ SqlSession ��ü�� �����ϱ� ���� SqlSessionFactory��ü�� ����Ѵ�.

	//Mybatis Spring ���� ����� ����ϸ� SqlSessionFactory�� ���� ����� �ʿ䰡 ����.
	//�ֳ��ϸ� ������ Ʈ����� ������ ���� �ڵ����� Ŀ�� �Ǵ� �ѹ��� �����ϰ� �ݾ�����,
	//�����忡 ������ SqlSession��ü�� Spring Bean�� ���Ե� �� �ֱ� �����̴�.
	
	//SqlSessionTemplateŬ������ SqlSession�� �����ϰ� �ڵ忡�� sqlSession�� ��ü�ϴ� ������ �Ѵ�.
	//SQL�� ó���ϴ� Mybatis Method�� ȣ���� �� SqlSessionTemplate�� SqlSession�� ������ Spring transaction����
	//���� �� �ֵ��� �������ش�.
	//SqlSessionTemplate�� �ʿ��� �������� Session�� �ݰ�, Commit�ϰų� Rollback�ϴ°��� ������
	//SqlSession�� ����������Ŭ�� �����Ѵ�.
	
	@Bean
	public SqlSessionTemplate sqlSessionBean() throws Exception {
		return new SqlSessionTemplate(factoryBean());
	}
	
}
