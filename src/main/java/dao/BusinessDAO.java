package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BusinessDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class BusinessDAO {

	final SqlSession sqlSession;
	
	//숙소 카테고리별 조회
	public List<BusinessDTO> selectList(String bu_id) {
		return sqlSession.selectList("b.category",bu_id);
	}
	
	
	public BusinessDTO selectOne(String bu_email) {
		return sqlSession.selectOne("b.bu_loginCheck", bu_email);
	}
	
	public int insert(BusinessDTO dto) {
		return sqlSession.insert("b.insert", dto);
	}
	
	
	
}
