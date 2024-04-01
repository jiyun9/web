package service;

import java.sql.SQLException;

import org.apache.ibatis.type.TypeException;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.util.NestedServletException;

import util.MyCommon;

@ControllerAdvice
public class Exception {
	

	@ExceptionHandler(NestedServletException.class)
	public String nestException(){
		System.out.println("nest");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	@ExceptionHandler(MyBatisSystemException.class)
	public String mybatisException(){
		System.out.println("mybatis");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	@ExceptionHandler(TypeException.class)
	public String typeException(){
		System.out.println("type");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	@ExceptionHandler(SQLException.class)
	public String sqlException(){
		System.out.println("sql");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String nohandlerException(NoHandlerFoundException e){
		System.out.println("404¿¡·¯");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String NullPointerException(){
		System.out.println("nullpointer");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
	
	//IndexOutOfBoundsException
	@ExceptionHandler(IndexOutOfBoundsException.class)
	public String IndexOutOfBoundsException(){
		System.out.println("Index");
		return MyCommon.VIEW_PATH + "error.jsp";
	}
}
