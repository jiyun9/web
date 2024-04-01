package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class MemberDAO {
	
	final SqlSession sqlSession;
	
	
	public MemberDTO selectOne(String m_email) {
		return sqlSession.selectOne("m.loginCheck",m_email);
	}
	
	
	public int insert(MemberDTO dto) {
		return sqlSession.insert("m.insert",dto);
	}
	
	public int pwdModify(String m_email,String m_pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_email", m_email);
		map.put("m_pwd", m_pwd);
		
		return sqlSession.update("m.pwdModify", map);
	}
	
	
	
}
