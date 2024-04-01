package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ReviewDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReviewDAO {
	
	final SqlSession sqlSession;
	
	public List<ReviewDTO> selectList(String bu_email) {
		return sqlSession.selectList("rev.review_list", bu_email);
	}
	
	public int reply(HashMap<String, String> map) {
		return sqlSession.update("rev.review_reply", map);
	}
}
