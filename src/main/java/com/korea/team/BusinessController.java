package com.korea.team;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BusinessDAO;
import dao.ReservationDAO;
import dao.ReviewDAO;
import dao.RoomDAO;
import dto.BusinessDTO;
import dto.ReservationDTO;
import dto.ReviewDTO;
import dto.RoomDTO;
import lombok.RequiredArgsConstructor;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class BusinessController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	final BusinessDAO business_dao;

	@Autowired
	final RoomDAO room_dao;

	@Autowired
	final ReservationDAO res_dao;

	@Autowired
	final ReviewDAO rev_dao;

	// 사업자 이메일
	String bu_email;

	// 사업자 로그인시 첫 페이지
	@RequestMapping("businessPage")
	public String businessPage() {
		return MyCommon.VIEW_PATH + "business/businessTopView.jsp";
		// return "roomList_form";
	}

	// 객실 등록 페이지
	@RequestMapping("addRoom_form")
	public String addRoom_from() {
		System.out.println("addroom: " + bu_email);
		return MyCommon.VIEW_PATH + "business/addRoom.jsp";

	}

	// 객실 등록
	@RequestMapping("addRoom")
	public String addRoom(RoomDTO dto) {
		photo_upload(dto);
		dto.setRo_info(change_string(dto.getRo_info()));
		dto.setBu_email(bu_email);
		int res = room_dao.add(dto);

		if (res > 0) {
			return "redirect:roomList_form";
		}

		return null;
	}

	// 객실 리스트 페이지
	@RequestMapping("roomList_form")
	public String roomList_form(Model model) {
		if (bu_email == null) { // email이 등록이 안되어 있으면 로그인이 안되어 있는 상태로 생각.
			return MyCommon.VIEW_PATH + "business/check_bu.jsp";
		}

		List<RoomDTO> list = room_dao.selectList(bu_email);

		model.addAttribute("list", list);

		return MyCommon.VIEW_PATH + "business/roomList.jsp";
	}

	// 객실 상세보기
	@RequestMapping("detail")
	public String detail(Model model, int ro_num) {
		RoomDTO dto = room_dao.selectOne(ro_num);
		model.addAttribute("dto", dto);

		return MyCommon.VIEW_PATH + "business/view_detail.jsp";
	}

	// 수정화면
	@RequestMapping("modify_form")
	public String modify_form(Model model, int ro_num) {
		System.out.println(bu_email);
		// 매개변수로 넘어온 idx를 이용해 게시물 한건을 찾는다.
		// RoomDTO dto = room_dao.selectOne(idx);
		System.out.println(ro_num);
		RoomDTO dto = room_dao.selectOne(ro_num);
		model.addAttribute("dto", dto);

		return MyCommon.VIEW_PATH + "business/roomModify.jsp";
	}

	// 수정 기능
	@RequestMapping("modify")
	public String modify(RoomDTO dto) {
		if (!dto.getRopicture()[0].isEmpty()) { //
			photo_upload(dto);
			System.out.println("사진업로드완료");
		} else {
			dto.setRo_picture(dto.getRo_name() + "_" + dto.getPicture_count() + ".jpeg");
			System.out.println("사진 없음");
		}
		dto.setBu_email("hhh@naver.com");
		int res = room_dao.update(dto);

		if (res > 0) {
			return "redirect:roomList_form";
		}

		return null;
	}

	// 객실 삭제
	@RequestMapping("delete")
	@ResponseBody
	public String delete(int num, String ro_name) {
		delete_folder(ro_name);

		int res = room_dao.delete(num);

		String result = "no";

		if (res == 1) {
			result = "yes";
		}

		String finRes = String.format("[{'res':'%s'}]", result);
		return finRes;
	}

	// 예약 정보 페이지
	@RequestMapping("reservation_form")
	public String reservation_form(Model model) {
		if (bu_email == null) { // email이 등록이 안되어 있으면 로그인이 안되어 있는 상태로 생각.
			return MyCommon.VIEW_PATH + "business/businessTopView.jsp";
		}

		System.out.println(bu_email);
		List<ReservationDTO> list = res_dao.selectList(bu_email);

		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH + "business/reservation_confirm.jsp";
	}

	// 에약 정보 검색
	@RequestMapping("search_reservation")
	public String search_reservation(Model model, String box, String text) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bu_email", bu_email);
		map.put("box", box);
		map.put("text", text);
		System.out.println("controller : " + text);

		List<ReservationDTO> list = res_dao.search(map);
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH + "business/reservation_confirm.jsp";

	}

	// 체크인화면
	@RequestMapping("checkIn_form")
	public String checkIn_form(Model model) {
		if (bu_email == null) { // email이 등록이 안되어 있으면 로그인이 안되어 있는 상태로 생각.
			return MyCommon.VIEW_PATH + "business/businessTopView.jsp";
		}

		System.out.println(bu_email);
		List<ReservationDTO> list = res_dao.selectList(bu_email);

		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH + "business/checkIn.jsp";
	}

	// 체크인 예약상태 변경
	@RequestMapping("checkIn")
	@ResponseBody
	public String checkin(String num) {
		int res = res_dao.checkIn(num);

		if (res == 1) {
			return "[{'result':'yes'}]";
		} else {
			return "[{'result':'no'}]";
		}
	}

	// 체크아웃 화면
	@RequestMapping("checkOut_form")
	public String checkOut_form(Model model) {
		if (bu_email == null) { // email이 등록이 안되어 있으면 로그인이 안되어 있는 상태로 생각.
			return MyCommon.VIEW_PATH + "business/businessTopView.jsp";
		}

		System.out.println(bu_email);
		List<ReservationDTO> list = res_dao.selectList(bu_email);

		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH + "business/checkOut.jsp";
	}

	// 체크아웃 예약상태 변경
	@RequestMapping("checkOut")
	@ResponseBody
	public String checkOut(String num) {
		int res = res_dao.checkOut(num);

		if (res == 1) {
			return "[{'result':'yes'}]";
		} else {
			return "[{'result':'no'}]";
		}
	}

	// 리뷰 화면
	@RequestMapping("review_form")
	public String review_form(Model model) {
		if (bu_email == null) { // email이 등록이 안되어 있으면 로그인이 안되어 있는 상태로 생각.
			return MyCommon.VIEW_PATH + "business/businessTopView.jsp";
		}

		List<ReviewDTO> list = rev_dao.selectList(bu_email);
		model.addAttribute("list", list);
		return MyCommon.VIEW_PATH + "business/review.jsp";
	}

	@RequestMapping("review_reply")
	@ResponseBody
	public String review_reply(Model model, String rev_num, String replyBox) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("rev_num", rev_num);
		map.put("replyBox", replyBox);

		int res = rev_dao.reply(map);

		if (res == 1) {
			return "[{'result':'yes'}]";
		} else {
			return "[{'result':'no'}]";
		}
	}

	// 사업자 로그인
	@RequestMapping("bu_login")
	@ResponseBody
	public String login(String bu_email, String bu_password) {
		this.bu_email =bu_email;
		BusinessDTO dto = business_dao.selectOne(bu_email);
		session = request.getSession();
		if (dto == null) {
			return "[{'param':'no_bu_email'}]";
		}

		if (!bu_password.equals(dto.getBu_password())) {
			return "[{'param':'no_bu_password'}]";
		}

		session.setAttribute("bu_dto", dto);

		return "[{'param':'clear'}]";
	}

	// 사업자 로그아웃
	@RequestMapping("bu_logout")
	public String logout() {
		bu_email = "";
		session.removeAttribute("dto");
		session.invalidate();
		return "redirect:index";
	}

	@RequestMapping("business_insert_form")
	public String business_insert_form() {
		return MyCommon.VIEW_PATH + "business/business_insert_form.jsp";
	}

	@RequestMapping("check_bu_email")
	@ResponseBody
	public String check_bu_email(String bu_email) {
		BusinessDTO dto = business_dao.selectOne(bu_email);

		if (dto == null) {
			return "[{'result':'yes'}]";
		}
		return "[{'result':'no'}]";
	}

	@RequestMapping("business_insert")
	public String business_insert(BusinessDTO dto) {
		photo_upload(dto);
		int res = business_dao.insert(dto);

		if (res > 0) {
			return "redirect:index";
		}
		return null;
	}

	// 함수---------------------------------함수--------------------함수-------------
	// 객실 수정 및 등록시 사진 업로드
	public RoomDTO photo_upload(RoomDTO dto) {
		String webPath = "/resources/" + bu_email + '/';
		webPath = String.format("%s/%s/", webPath, dto.getRo_name());
		String savePath = request.getServletContext().getRealPath(webPath);

		System.out.println(savePath);

		int picCount = dto.getPicture_count(); // 3

		for (int i = 0; i < dto.getRopicture().length; i++) {
			System.out.println(i);
			MultipartFile photo = dto.getRopicture()[i];
			String fileName = "no_file";

			if (!photo.isEmpty()) {
				fileName = dto.getRo_name() + '_' + (++picCount) + ".jpeg"; // 방이름_1.jpeg, 방이름_2.jpeg

				File saveFile = new File(savePath, fileName);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					saveFile.delete();
					saveFile = new File(savePath, fileName);
				}

				try {
					photo.transferTo(saveFile);
				} catch (Exception e) {

				}
				dto.setRo_picture(fileName);
				dto.setPicture_count(picCount);
			}
		}

		return dto;

	}

	// 객실 수정시 객실명이 바뀌면 새로 사진이 담길 폴더를 만들기 때문에
	// 기존 객실이름으로 만들어진 폴더를 삭제하는 메서드
	public void delete_folder(String x_name) {
		x_name = "/resources/" + bu_email + '/' + x_name + '/';

		File x_file = new File(request.getServletContext().getRealPath(x_name));

		File[] deleteFolderList = x_file.listFiles();

		for (int j = 0; j < deleteFolderList.length; j++) {
			deleteFolderList[j].delete();
		}

		x_file.delete();
	}

	public String change_string(String info) {
		return info.replaceAll("\n", "<br>");
	}

	// -----------------------비즈니스 사진등록 함수----------------------------------------
	public BusinessDTO photo_upload(BusinessDTO dto) {
		String webPath = "/resources/business_img/";
		webPath = String.format("%s/%s/", webPath, dto.getBu_title());
		String savePath = request.getServletContext().getRealPath(webPath);

		System.out.println(savePath);

		int picCount = dto.getPicture_count();

		for (int i = 0; i < dto.getBupicture().length; i++) {
			System.out.println(i);
			MultipartFile photo = dto.getBupicture()[i];
			String fileName = "no_file";

			if (!photo.isEmpty()) {
				fileName = dto.getBu_title() + "_" + (++picCount) + ".jpeg";

				File saveFile = new File(savePath, fileName);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					saveFile.delete();
					saveFile = new File(savePath, fileName);
				}

				try {
					photo.transferTo(saveFile);
				} catch (Exception e) {

				}
				dto.setBu_picture(fileName);
				dto.setPicture_count(picCount);
			}
		}
		return dto;
	}

}
