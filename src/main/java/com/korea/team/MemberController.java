package com.korea.team;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import service.MailSendService;
import util.MyCommon;

@Controller
@RequiredArgsConstructor
public class MemberController {

	final MemberDAO member_dao;

	@Autowired
	HttpSession session;

	@Autowired
	MailSendService mailService;

	@RequestMapping("login")
	@ResponseBody
	public String login(String m_email, String m_pwd) {

		MemberDTO dto = member_dao.selectOne(m_email);

		if (dto == null) {
			return "[{'param':'no_m_email'}]";
		}

		if (!m_pwd.equals(dto.getM_pwd())) {
			return "[{'param':'no_m_pwd'}]";
		}

		session.setAttribute("m_email", dto);

		return "[{'param':'clear'}]";
	}

	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("m_email");
		return "redirect:index";
	}

	@RequestMapping("member_insert_form")
	public String member_insert_form() {
		return MyCommon.VIEW_PATH + "member/member_insert_form.jsp";
	}

	@RequestMapping("check_m_email")
	@ResponseBody
	public String check_m_email(String m_email) {
		MemberDTO dto = member_dao.selectOne(m_email);

		if (dto == null) {
			return "[{'result':'yes'}]";
		}
		return "[{'result':'no'}]";
	}

	@RequestMapping("member_insert")
	public String member_insert(MemberDTO dto) {
		int res = member_dao.insert(dto);

		if (res > 0) {
			return "redirect:index";
		}
		return null;
	}

	@RequestMapping("pwd_modify")
	public String pwd_modify() {
		return MyCommon.VIEW_PATH + "member/member_email_authcode.jsp";
	}

	@RequestMapping("m_email_authcode")
	@ResponseBody
	public String m_email_authcode(String m_email) {
		MemberDTO dto = member_dao.selectOne(m_email);

		String code = mailService.m_email_authcode(m_email);

		if (dto == null) {
			return "[{'result':'no'}]";
		}
		return "[{'result':'yes'}, {'auth':'" + code + "'}]";
	}

	@RequestMapping("authcode")
	public String authcode(String m_email) {
		return MyCommon.VIEW_PATH + "member/member_authcode.jsp?m_email=" + m_email;
	}

	@RequestMapping("m_pwd_modify")
	public String m_pwd_modify(String m_email) {
		return MyCommon.VIEW_PATH + "member/member_pwd_modify.jsp?m_email=" + m_email;
	}

	@RequestMapping("member_pwd_modify")
	public String pwd_modify(String m_email, String m_pwd) {

		int res = member_dao.pwdModify(m_email, m_pwd);

		if (res > 0) {
			return MyCommon.VIEW_PATH + "main/index.jsp";
		}
		return null;
	}

}
