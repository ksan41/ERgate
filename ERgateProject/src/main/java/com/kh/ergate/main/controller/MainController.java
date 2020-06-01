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
	
	
	@RequestMapping("loginTest.ma")
	public String loginTest() {
		return "main/loginIndex";
	}
	
	@RequestMapping("login.ma")
	public String loginMember(Employee e, HttpSession session, Model model) {
		
		Employee loginUser = mService.loginMember(e);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			return "main/main";
		}else {
			model.addAttribute("msg", "로그인에 실패하였습니다. 알맞은 아이디와 비밀번호를 입력해주세요.");
			return "redirect:/";
		}
	}
	
	
	@RequestMapping
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	// page 이동용 메소드
	
	@RequestMapping("enroll.ma")
	public String enrollMember() {
		return "main/accountRequest";
	}
	
	@RequestMapping("returnLogin.ma")
	public String returnLogin() {
		return "main/loginIndex";
	}

}
