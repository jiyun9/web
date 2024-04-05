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
	
	// 회원추가
	public int insert(MemberDTO dto) {
		return sqlSession.insert("m.insert",dto);
	}
	
	// 비밀번호 수정
	public int pwdModify(String m_email,String m_pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_email", m_email);
		map.put("m_pwd", m_pwd);
		
		return sqlSession.update("m.pwdModify", map);
	}
	
	// 회원정보
	public MemberDTO memberInfo(String m_email){
		return sqlSession.selectOne("m.memberInfo", m_email);
	}
	
}
