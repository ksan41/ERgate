package com.kh.ergate.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.main.model.service.MainService;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class MainController {
	
	@Autowired
	private MainService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.ma")
	public String loginMember(Employee e, HttpSession session, Model model) {
		
		Employee loginUser = mService.loginMember(e);
		
		
		// 비밀번호 암화화 과정 추가하기
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "main/main";
		}else {
			model.addAttribute("msg", "로그인에 실패하였습니다. 알맞은 아이디와 비밀번호를 입력해주세요.");
			return "redirect:/";
		}
	}
	
	
	@RequestMapping("logout.ma")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	// page 이동용 메소드
	
	@RequestMapping("loginTest.ma")
	public String loginTest() {
		return "main/loginIndex";
	}
	
	@RequestMapping("accountForm.ma")
	public String accountForm() {
		return "main/accountRequest";
	}
	
	@RequestMapping("returnLogin.ma")
	public String returnLogin() {
		return "main/loginIndex";
	}
	
	@RequestMapping("findIdForm.ma")
	public String findIdForm() {
		return "main/findId";
	}
	
	@RequestMapping("findId.ma")
	public String findId() {
		return "main/findIdSuccess";
	}
	
	@RequestMapping("findPwdForm.ma")
	public String findPwdForm() {
		return "main/findPwd";
	}
	
	@RequestMapping("findPwd.ma")
	public String findPwd() {
		return "main/findPwdSuccess";
	}
	
	

}
