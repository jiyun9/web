package context;


import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.BusinessDAO;
import dao.MemberDAO;
import dao.ReservationDAO;
import dao.ReviewDAO;
import dao.RoomDAO;
import dao.SearchDAO;


@Configuration
public class Context_3_dao {

		
	@Bean
	public RoomDAO roomDAO(SqlSession sqlSession) {
		return new RoomDAO(sqlSession);
	}
	
	@Bean
	public ReservationDAO reservationDAO(SqlSession sqlSession) {
		return new ReservationDAO(sqlSession);
	}
	
	@Bean
	public MemberDAO memberDAO(SqlSession sqlSession) {
		return new MemberDAO(sqlSession);
	}
	
	@Bean
	public BusinessDAO businessDAO(SqlSession sqlSession) {
		return new BusinessDAO(sqlSession);
	}
	
	@Bean
	public SearchDAO searchDAO(SqlSession sqlSession) {
		return new SearchDAO(sqlSession);
	}
	
	@Bean
	public ReviewDAO reviewDAO(SqlSession sqlSession) {
		return new ReviewDAO(sqlSession);
	}
	
	
}
