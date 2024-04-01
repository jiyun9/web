package com.korea.team;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReservationDAO;
import dao.RoomDAO;
import dto.ReservationDTO;
import dto.RoomDTO;
import lombok.RequiredArgsConstructor;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class ReservationController {
	
	@Autowired
	final RoomDAO room_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	final ReservationDAO reservation_dao;
	
	
	//객실 예약 페이지
	@RequestMapping("reservation_form_member")
	public String reservation_form_member(Model model,int ro_num,String bu_title,String checkin_d,String checkout_d) {
		RoomDTO dto = room_dao.selectOne(ro_num);
		model.addAttribute("dto", dto);
		
		
		model.addAttribute("bu_title",bu_title);
		model.addAttribute("checkin_d",checkin_d);
		model.addAttribute("checkout_d",checkout_d);
		
		return MyCommon.VIEW_PATH+"reservation/reservation_form.jsp";
	}
	
	
	//예약하기 기능
	@RequestMapping("reservation_operator")
	public String reservation(ReservationDTO dto) {

//		dto.setCheckin_date(checkin_d);
//		dto.setCheckout_date(checkout_d);
		dto.setStatus("결제 완료");
		
		
		
		int res = reservation_dao.add(dto);

		if (res > 0) {
			System.out.println("완료");
			return "redirect:index";
		}

		return null;
	}
	
	
	//멤버 예약 내역
	@RequestMapping("rev_list")
	public String select(Model model, String m_email) {
		
		List<ReservationDTO> list = reservation_dao.revList(m_email);
		
		
		model.addAttribute("list", list);

		return MyCommon.VIEW_PATH + "reservation/rev_list_user.jsp";

	}
	

}
