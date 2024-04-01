package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ReservationDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReservationDAO {
	
	final SqlSession sqlSession;	
	
	//사업자 예약내역 확인
	public List<ReservationDTO> selectList(String bu_email){
		return sqlSession.selectList("rv.select",bu_email);
	}
	
	public List<ReservationDTO> search(HashMap<String, String> map){
		System.out.println(map.get("box"));
		System.out.println(map.get("text"));
		return sqlSession.selectList("rv.search",map);
	}
	
	public int checkIn(String num) {
		//System.out.println(num);
		return sqlSession.update("rv.checkIn",num);
	}
	
	public int checkOut(String num) {
		return sqlSession.update("rv.checkOut",num);
	}
	
	
	public int add(ReservationDTO dto) {
		return sqlSession.insert("rv.reserve", dto);
	}
	
	
	
	
	//-------------member---------------------------
	public List<ReservationDTO> revList(String m_email){
		return sqlSession.selectList("rv.rev_list",m_email);
	}
}
