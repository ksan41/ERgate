package com.kh.ergate.meetingroom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.kh.ergate.meetingroom.model.service.MeetingroomServiceImpl;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomDate;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;
import com.kh.ergate.vehicle.model.vo.Vehicle;


@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomServiceImpl mrService;

	// 회의실 예약용 
	@RequestMapping("reserveMtroom.me")
	public String reserveMtroom(MeetingroomReservation mr, HttpSession session) {
		
		int result = mrService.reserveMtroom(mr);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약되었습니다.");
			return "redirect:myReserve.me";
		}else {
			session.setAttribute("msg", "예약 실패하였습니다. 다시 시도해주세요");
			return "redirect:myReserve.me";
		}
	}

	// 현재 예약 조회용
	@RequestMapping("currentStatus.me")
	public String currentStatus(Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}
	
	// 날짜선택예약현황조회용(currentStatusD.me) --- currentStatusDay(String day,Model model)
	@RequestMapping("currentStatusD.me")                             
	public String currentStatusDay(MeetingroomDate md, MeetingroomReservation mr, Model model) {
		
		
		ArrayList<MeetingroomReservation> list = mrService.searchListt(md);
		
		System.out.println(md);
		model.addAttribute("md", md);
		model.addAttribute("list", list);
		
		return "meetingroom/meetingroomCurrentStatus";
		
	}
	
	
	// 회의실 예약 현황 리스트 조회용

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Model model) {

		int listCount = mrService.statusListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<MeetingroomReservation> list = mrService.statusList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "meetingroom/meetingroomReservationList";
	}
	
	// 회의실예약현황  일선택 조회용(statusM.me) ---statusListMonth(String month,Meetingroom,Model)

	/*
	 * @RequestMapping("statusM.me") public String statusListMonth(MeetingroomDate
	 * md, MeetingroomReservation mr, Model model) {
	 * 
	 * int listCount = mrService.searchListCount(md);
	 * 
	 * ArrayList<MeetingroomReservation> list = mrService.statusListMonth();
	 * 
	 * model.addAttribute("month", month); model.addAttribute("list", list);
	 * 
	 * return "meetingroom/meetingroomReservationList";
	 * 
	 * }
	 */
	// 예약 상세 조회용
	@RequestMapping("reserveDetail.me")
	public String reserveDetail(int reservNo, Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}

	// 내 예약현황 리스트 조회용
	@RequestMapping(value="myReserve.me")
	public void myReserveList(String empId, Model model, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {

		  ArrayList<MeetingroomReservation> list = mrService.myReserveList(empId);
		  
		  model.addAttribute("list", list);
		  
		  response.setContentType("application/json; charset=utf-8");
		  
		  new Gson().toJson(list, response.getWriter());
	}
	
	// 예약취소용(cancelReserve.me) ---cancelReserve(int mtrmReservNo,Model)
	@RequestMapping("cancelReserve.me")
	public String cancelReserve(int mtrmReservNo, HttpSession session) {
		
		int result = mrService.cancelReserve(mtrmReservNo);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약 취소되었습니다.");
			return "redirect:myReserve.me?currentPage=1";
		}else {
			session.setAttribute("msg", "예약 취소 실패하였습니다. 다시 시도해 주세요");
			return "redirect:myReserve.me?currentPage=1";
		}
	}

	// 회의실정보 조회용
	@RequestMapping("mtroomDetail.me")
	public String selectMtroomDetail(int currentPage, Meetingroom m, Model model) {

		int listCount = mrService.selectMtroomDetailListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Meetingroom> list = mrService.selectMtroomDetail();

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "meetingroom/meetingroomManagement";

	}

	// 회의실 등록용
	@RequestMapping("insertMtroom.me")
	public String insertMeetingroom(Meetingroom m, HttpSession session,
									@RequestParam(name="uploadFile", required=false) MultipartFile file,
									HttpServletRequest request, Model model) {
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			m.setMtrmImage(changeName);
		}
		
		System.out.println(m);
		
		int result = mrService.insertMeetingroom(m);

		if(result > 0) { 
			session.setAttribute("msg", "성공적으로 회의실이 등록되었습니다.");
			return "redirect:mtroomDetail.me";

		} else {
			session.setAttribute("msg", "회의실 등록에 실패하였습니다. 다시 시도해주세요");
			return "redirect:mtroomDetail.me";
		}
	}
	
	// 회의실 정보 조회 ajax
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="select.me",
	 * produces="application/json; charset=utf-8") public String
	 * selectMeetingroom(String mtrmCode) {
	 * 
	 * Meetingroom meetingroom = mrService.selectVehicle(mtrmCode);
	 * 
	 * return new Gson().toJson(meetingroom); }
	 */
	
	
	// 회의실수정용
	@RequestMapping("updateMtroom.me")
	public String updateMeetingroom(Meetingroom m, HttpSession session,
									@RequestParam(name="reUploadFile", required=false) MultipartFile file,
									HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(m.getMtrmImage() != null) {
				deleteFile(m.getMtrmImage(), request);
			}
			
			String changeName = saveFile(file, request);
			m.setMtrmImage(changeName);
		}

		int result = mrService.updateMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 회의실 정보가 수정되었습니다.");
			return "redirect:mtroomDetail.me";
			
		}else {
			session.setAttribute("msg", "회의실 정보 수정에 실패하였습니다. 다시 시도해주세요");
			return "redirect:mtroomDetail.me";
		}
		
		
	}
	
	// 회의실 삭제
	@RequestMapping("deleteMtroom.me")
	public String deleteMeetingroom(Meetingroom m, HttpSession session) {
		
		int result = mrService.deleteMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 회의실이 삭제되었습니다.");
			return "redirect:mtroomDetail.me?currentPage=1";
		}else {
			session.setAttribute("msg", "삭제에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:mtroomDetail.me?currentPage=1";
		}
		
	}
	
	
	
	// =========================================================
	
	// 첨부파일 관련 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = resources + "\\uploadFiles\\meetingroom\\"; 
		
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

	

}
