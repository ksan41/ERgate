package com.kh.ergate.main.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ergate.common.template.MyAuthentication;
import com.kh.ergate.main.model.service.MainService;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.schedule.model.service.ScheduleService;
import com.kh.ergate.schedule.model.vo.Schedule;

@Controller
public class MainController {
	
	@Autowired
	private MainService mService;
	
	@Autowired
	private ScheduleService sService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	// 메인 페이지로 이동
	@RequestMapping("main.ma")
	public ModelAndView mainPage() {
		ArrayList<Schedule> slist = sService.selectScheduleList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/main");
		mv.addObject("slist", slist);
		
		return mv;
		
	}
	
	
	// ---------- 로그인 관련 ----------
	
	// 로그인
	@RequestMapping("login.ma")
	public String loginMember(Employee e, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Employee loginUser = mService.loginMember(e);
		
		String saveId = request.getParameter("saveId");
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			
			session.setAttribute("loginUser", loginUser);
	        
	        //쿠키
	        Cookie c =new Cookie("saveId", e.getEmpId());

	        if(saveId != null) {
	            c.setMaxAge(7 * 24 * 60 * 60);
	        }else {
	            c.setMaxAge(0);
	        }
	        
	        c.setPath("/");
	        
	        response.addCookie(c);
			
			return "main/main";
			
		}else {
			session.setAttribute("msg", "로그인에 실패하였습니다. 알맞은 아이디와 비밀번호를 입력해주세요.");
			return "redirect:returnLogin.ma";
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.ma")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:returnLogin.ma";
	}
	
	// 계정등록 
	@RequestMapping("insertRequest.ma")
	public String insertRequest(Employee e, String empEmail, HttpServletRequest request, 
			 					@RequestParam(name="uploadFile", required=false) MultipartFile file,
			  					Model model, HttpSession session) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			e.setEmpImage(changeName);
		}
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		e.setEmpPwd(encPwd);
		
		e.setEmpPriEmail(empEmail + "@gmail.com");
		
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
	
	// 이름 중복검사
	@ResponseBody
	@RequestMapping("nameCheck.ma")
	public String nameCheck(String empName) {
		
		int count = mService.nameCheck(empName);
		
		if(count > 0) {
			return "fail";
		}else {
			return "success";
		}
	}
		
	// 회원정보 수정
	@RequestMapping("update.ma")
	public String updateMember(Employee e, String newPwd, String empEmail, HttpSession session,
							   @RequestParam(name="reUploadFile", required=false) MultipartFile file,
							   HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(e.getEmpImage() != null) {
				deleteFile(e.getEmpImage(), request);
			}
			
			String changeName = saveFile(file, request);
			e.setEmpImage(changeName);
		}
		
		if(!newPwd.equals("")) {
			String encPwd = bcryptPasswordEncoder.encode(newPwd);
			e.setEmpPwd(encPwd);
		}else {
			e.setEmpPwd(e.getEmpPwd());
		}
		
		e.setEmpPriEmail(empEmail + "@gmail.com");
		
		int result = mService.updateMember(e);
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(e));
			session.setAttribute("msg", "개인 정보 수정이 성공적으로 완료되었습니다.");
			return "redirect:main.ma";
		}else {
			session.setAttribute("msg", "개인 정보 수정에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:mypage.ma";
		}
	}
	
	// 아이디 찾기
	@RequestMapping("findId.ma")
	public String findId(Employee e, String email, HttpSession session) {
		
		e.setEmpPriEmail(email + "@gmail.com");

		Employee loginUser = mService.findId(e);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "main/findIdSuccess";
		}else {
			session.setAttribute("msg", "아이디 찾기에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:findIdForm.ma";
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping("findPwd.ma")
	public String findPwd(Employee e, String email, HttpSession session) {
		
		e.setEmpPriEmail(email + "@gmail.com");
		
		Employee loginUser = mService.findPwd(e);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "main/findPwdSuccess";
		}else {
			session.setAttribute("msg", "비밀번호 찾기에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:findPwdForm.ma";
		}
	}
	
	// 비밀번호 변경
	@RequestMapping("updatePwd.ma")
	public String updatePwd(String newPwd, HttpSession session) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		e.setEmpPwd(encPwd);
		
		int result = mService.updatePwd(e);
		if(result > 0) {
			session.setAttribute("msg", "비밀번호 변경이 성공적으로 완료되었습니다.");
			return "redirect:returnLogin.ma";
		}else {
			session.setAttribute("msg", "비밀번호 변경에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:findPwdForm.ma";
		}
	}
	
	
	// ---------- 페이지 이동용 ----------

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
	
	
	// ---------- 인증메일 전송 메소드 ----------
	
	@ResponseBody
	@RequestMapping("emailAuth.ma")
	public String emailAuth(String id)throws Exception {
		
		// 여기에 발송할 사람 메일주소 들어가야 함. dddd@gmail.com
		String email = id + "@gmail.com";
		
		// 인증코드 들어갈 변수선언
		String authNum = "";
		
		//랜덤값 변수에 저장
		authNum = RandomNum(); 
		
		//매개변수에 주소와 인증코드 입력하고, 메일 전송 메소드 호출.
		sendEmail(email, authNum); 
		
		return authNum;
	}
	
	private void sendEmail(String email, String authNum) {
		
		Properties props = System.getProperties(); 
		
		props.put("mail.smtp.starttls.enable", "true");
		//props.put("mail.transport.protocol", "smtp"); 
		props.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버주소
		//props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory.class");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587"); // gmail 포트번호
		//props.put("mail.smtp.user", from);
		
		Authenticator auth = new MyAuthentication();
		
		Session session = Session.getDefaultInstance(props,auth);
		MimeMessage msg = new MimeMessage(session);

		try {
		
			msg.setSentDate(new Date()); // 메일 발송시간(현재시간)
			
			InternetAddress from = new InternetAddress("dlfroal06@gmail.com");//발신자 메일주소
			
			// 이메일 발신자
			msg.setFrom(from);
			
			// 이메일 수신자
			InternetAddress to = new InternetAddress(email); // 수신자 메일주소
			
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 이메일 제목
			msg.setSubject("ERgate 인증 이메일","UTF-8");
			
			// 이메일 내용
			msg.setText("ERgate 인증번호 ["+authNum+"]","UTF-8");
			
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			// 메일 보내기
			javax.mail.Transport.send(msg);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public String RandomNum() {
		
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <= 6; i++) {
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
	// ---------- 메소드 선언 ----------
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로 (String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources"); // webapp 폴더의 resources 폴더까지의 물리적인 경로
		String savePath = resources + "\\uploadFiles\\main\\"; // 실제로 저장되어있는 폴더 (resources 폴더 안 경로)
		
		
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명
		// 년월일시분초 (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		// 최종 수정명 (20200522202011.jpg)
		String changeName = currentTime + ext;
		
		
		// 서버에 파일을 업로드시키는 메소드
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		// (실행 후 리턴값 없음)
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\main\\";
		
		File deleteFile = new File(savePath + fileName); // 삭제하고자 하는 풀 경로(경로+파일명)
		deleteFile.delete(); // 실제 서버의 파일 찾아 삭제 처리
		
	}
	
}
