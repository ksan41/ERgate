package com.kh.ergate.meetingroom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.meetingroom.model.service.MeetingroomService;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomService mrService;

	
	// 업무차량 메인
	@RequestMapping("currentStatus.me")
	public String selectCurrentStatus() {
		return "meetingroom/meetingroomCurrentStatus";
	}
	
	// 업무차량 예약 현황 (일별) 조회 ajax
	@RequestMapping("currentStatusAjax.me")
	public void currentStatusListAjax(String calYear, String calMonth, String calDay, HttpServletResponse response) throws JsonIOException, IOException {
		
		String month = calMonth.length() == 1 ? "0"+calMonth : calMonth; 
		String date = calYear + "/" + month + "/" + calDay;
		
		ArrayList<MeetingroomReservation> list = mrService.currentStatusList(date);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	// 나의 예약 현황 리스트 조회 ajax
	@RequestMapping(value="myReserve.me")
	public void myReserveList(String empId, int currentPage, HttpServletResponse response) throws JsonIOException, IOException {
		
		int listCount = mrService.selectReserveListCount(empId);
		
		HashMap<String, Object> map = new HashMap<>();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<MeetingroomReservation> list = mrService.myReserveMeetingroom(empId, pi);
		
		System.out.println(list);
		
		map.put("pi", pi);
		map.put("list", list);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
	}
	
	// 차량 예약 취소
	@ResponseBody
	@RequestMapping(value="cancelReserve.me")
	public String cancelReserveMeetingroom(int mtrmReserveNo) {
		
		int result = mrService.cancelReserveMeetingroom(mtrmReserveNo);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 차량 예약
	@RequestMapping("reserve.me")
	public String reserveMeetingroom(MeetingroomReservation mr, HttpSession session) {
		
		int result = mrService.reserveMeetingroom(mr);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약되었습니다.");
			return "redirect:currentStatus.me";
		}else {
			session.setAttribute("msg", "예약 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:currentStatus.me";
		}
		
	}

	// 차량 예약 현황 조회 (월별) - 관리자
	@RequestMapping("reserveList.me")
	public String reserveMeetingroomList() {
		return "meetingroom/meetingroomReservationList";
	}
	
	// 차량 예약 현황 조회 (월별) ajax - 관리자
	@RequestMapping(value="reserveListAjax.me", produces="application/json; charset=utf-8")
	public String reserveMeetingroomListAjax(String calYear, String calMonth, int currentPage, Model model, HttpServletResponse response) throws JsonIOException, IOException {
		
		String month = calMonth.length() == 1 ? "0"+calMonth : calMonth; 
		String date = calYear + "/" + month;

		int listCount = mrService.reserveMeetingroomListCount(date);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<MeetingroomReservation> list = mrService.reserveMeetingroomList(date, pi);
		
		HashMap<String, Object> map = new HashMap<>();
		
		System.out.println("월별" + list);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	// 차량 리스트 조회 - 관리자
	@RequestMapping("meetingroomList.me")
	public String selectMeetingroomList(int currentPage, Model model, HttpSession session) {

		int listCount = mrService.selectMeetingroomListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Meetingroom> list = mrService.selectMeetingroomList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "meetingroom/meetingroomManagement";
	}
	
	// 차량 등록 - 관리자
	@RequestMapping("insert.me")
	public String insertMeetingroom(Meetingroom m, HttpSession session,
								@RequestParam(name="uploadFile", required=false) MultipartFile file,
								HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			m.setMtrmImage(changeName);
		}
		
		int result = mrService.insertMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 등록되었습니다.");
			return "redirect:meetingroomList.me?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 등록에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:meetingroomList.me?currentPage=1";
		}
		
	}

	// 차량 정보 조회 ajax - 관리자
	@ResponseBody
	@RequestMapping(value="select.me", produces="application/json; charset=utf-8")
	public String selectMeetingroom(String mtrmCode) {
		
		Meetingroom meetingroom = mrService.selectMeetingroom(mtrmCode);
		return new Gson().toJson(meetingroom);
	}
	
	// 차량 수정 - 관리자
	@RequestMapping("update.me")
	public String updateMeetingroom(Meetingroom m, HttpSession session,
			   					@RequestParam(name="reUploadFile", required=false) MultipartFile file,
			   					HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {

			if(m.getMtrmImage() != null) {
				deleteFile(m.getMtrmImage(), request);
			}

			String changeName = saveFile(file, request);
			m.setMtrmImage(changeName);
		}else {
			
		}
		
		int result = mrService.updateMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 수정되었습니다.");
			return "redirect:meetingroomList.me?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 수정에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:meetingroomList.me?currentPage=1";
		}
		
	}

	// 차량 삭제 - 관리자
	@RequestMapping("delete.me")
	public String deleteMeetingroom(Meetingroom m, HttpSession session) {
		
		int result = mrService.deleteMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 삭제되었습니다.");
			return "redirect:meetingroomList.me?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 삭제에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:meetingroomList.me?currentPage=1";
		}
		
	}
	

	// ---------- 메소드 선언 ----------
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로 (String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources"); // webapp 폴더의 resources 폴더까지의 물리적인 경로
		String savePath = resources + "\\uploadFiles\\meetingroom\\"; // 실제로 저장되어있는 폴더 (resources 폴더 안 경로)
		
		
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
		String savePath = resources + "\\uploadFiles\\meetingroom\\";
		
		File deleteFile = new File(savePath + fileName); // 삭제하고자 하는 풀 경로(경로+파일명)
		deleteFile.delete(); // 실제 서버의 파일 찾아 삭제 처리
		
	}

}
