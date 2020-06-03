package com.kh.ergate.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ergate.main.model.service.MainService;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class MainController {
	
	@Autowired
	private MainService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인
	@RequestMapping("login.ma")
	public String loginMember(Employee e, HttpSession session) {
		
		Employee loginUser = mService.loginMember(e);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			return "main/main";
		}else {
			session.setAttribute("msg", "로그인에 실패하였습니다. 알맞은 아이디와 비밀번호를 입력해주세요.");
			return "redirect:/";
		}
	}
	
	
	// 로그아웃
	@RequestMapping("logout.ma")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 계정등록 
	@RequestMapping("insertRequest.ma")
	public String insertRequest(Employee e, String empEmail1, String empEmail2, String empAddress1, String empAddress2, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		e.setEmpPwd(encPwd);
		
		String empEmail = empEmail1 + empEmail2;
		e.setEmpPriEmail(empEmail);
		
		String empAddress = empAddress1 + empAddress2;
		e.setEmpAddress(empAddress);
		
		System.out.println(e.getEmpPriEmail());
		System.out.println(e.getEmpAddress());
		
		
		int result = mService.insertRequest(e);
		if(result > 0) {
			session.setAttribute("msg", "계정 등록 요청이 성공적으로 완료되었습니다. 계정 승인 후 로그인해 주세요.");
			return "redirect:returnLogin.ma";
		}else {
			session.setAttribute("msg", "계정 등록 요청에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:returnLogin.ma";
		}
	}
	
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping("idCheck.ma")
	public String idCheck(String empId) {
		
		int count = mService.idCheck(empId);
		
		if(count > 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	
	// 아이디 찾기
	@RequestMapping("findId.ma")
	public String findId() {
		return "main/findIdSuccess";
	}
	
	
	// 비밀번호 찾기
	@RequestMapping("findPwd.ma")
	public String findPwd() {
		return "main/findPwdSuccess";
	}
	
	
	
	// ---------- 페이지 이동용 ----------

	// 로그인 페이지로 이동
	@RequestMapping("loginTest.ma")
	public String loginTest() {
		return "main/loginIndex";
	}
	
	// 계정등록 페이지로 이동
	@RequestMapping("accountForm.ma")
	public String accountForm() {
		return "main/accountRequest";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("returnLogin.ma")
	public String returnLogin() {
		return "main/loginIndex";
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping("findIdForm.ma")
	public String findIdForm() {
		return "main/findId";
	}
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("findPwdForm.ma")
	public String findPwdForm() {
		return "main/findPwd";
	}

	// 마이페이지 페이지로 이동
	@RequestMapping("mypage.ma")
	public String mypage() {
		return "main/mypage";
	}
	
	// 메인 페이지로 이동
	@RequestMapping("main.ma")
	public String mainPage() {
		return "main/main";
	}

}
