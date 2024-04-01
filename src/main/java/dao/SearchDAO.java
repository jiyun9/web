package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.SearchDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class SearchDAO {
	
	final SqlSession sqlSession;
	
	//조건에 맞는 방 검색 - 체크인, 체크아웃, 인원수, 숙소명 OR 지역명
	public List<SearchDTO> selectList(HashMap<String,String> map){
		System.out.println(map.get("checkin_d"));
		System.out.println(map.get("checkout_d"));
		System.out.println(map.get("count"));
		System.out.println(map.get("txt"));
		
		return sqlSession.selectList("s.accommdation_list", map);
	}
	
	public List<SearchDTO> mapSearch(HashMap<Object, Object> map){
		return sqlSession.selectList("s.map_search", map);
	}
	
	
}
