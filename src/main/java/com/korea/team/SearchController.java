package com.korea.team;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BusinessDAO;
import dao.RoomDAO;
import dao.SearchDAO;
import dto.BusinessDTO;
import dto.RoomDTO;
import dto.SearchDTO;
import lombok.RequiredArgsConstructor;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class SearchController {

	final RoomDAO room_dao;
	final SearchDAO search_dao;
	final BusinessDAO business_dao;
	
	//메인 검색 기능-예약 가능한 숙박업소 검색
	@RequestMapping("search")
	public String main_search(Model model, String checkin_d, String checkout_d, int count, String txt) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkin_d", checkin_d);
		map.put("checkout_d", checkout_d);
		map.put("count", Integer.toString(count));
		map.put("txt", txt);

		List<SearchDTO> list = search_dao.selectList(map);
		
		model.addAttribute("checkin_d",checkin_d);
		model.addAttribute("checkout_d",checkout_d);
		model.addAttribute("list", list);
		
		return MyCommon.VIEW_PATH + "main/category.jsp";

	}

	// 카테고리별로 보기
	@RequestMapping("category")
	public String view_accomoList(Model model, @RequestParam(value = "bu_id", required = true) int bu_id) {
		
		List<BusinessDTO> list = business_dao.selectList(bu_id);
		
		model.addAttribute("list", list);

		return MyCommon.VIEW_PATH + "main/category.jsp?bu_id=" + bu_id;
	}
	
	
	// 객실보기(숙박업소 선택 시)
	@RequestMapping("room_view")
	public String room_view(Model model, String bu_email,String bu_title, String checkin_d,String checkout_d) {
		//System.out.println(checkin);
		List<RoomDTO> list = room_dao.selectList(bu_email);
		System.out.println(bu_email);
		model.addAttribute("list", list);
		
		model.addAttribute("bu_title",bu_title);
		model.addAttribute("checkin_d",checkin_d);
		model.addAttribute("checkout_d",checkout_d);
		return MyCommon.VIEW_PATH + "main/search_room.jsp";
	}
	
//	// map 검색
//	@RequestMapping("map_search")
//	@ResponseBody
//	public String mapSearch() {
//		
//	}

}
