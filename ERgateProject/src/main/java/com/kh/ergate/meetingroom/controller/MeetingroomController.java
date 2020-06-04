package com.kh.ergate.meetingroom.controller;




import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.meetingroom.model.service.MeetingroomServiceImpl;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

//어노테이션을 통해 bean으로 등록(내부적으로 HandlerMapping이 됨)
@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomServiceImpl mrService;
	

	/* 할 수 있는 부분부터 해서 주석 참고 바람*/
	
	@RequestMapping("reserveMtroom.me")
	public String reserveMtroom(MeetingroomReservation mr, Model model, HttpSession session) {
		
		int result = mrService.reserveMtroom(mr);
		
		if(result > 0) {
			
			session.setAttribute("msg", "회의실 예약 성공");
			return "redirect:/";
			
		}else {
			
			model.addAttribute("msg", "회의실 예약 실패");
			return "";
		}
		
		
		
	}

	
	
	
	// 회의실예약현황리스트조회용(statusList.me) --- statusList(Meetingroom,Model)

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Model model) {
		
		
		int listCount = mrService.statusListCount();

		//System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<MeetingroomReservation> list = mrService.statusList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "meetingroom/meetingroomReservationList";
	}
	
	@RequestMapping("currentStatus.me")
	public String currentStatus(Model model) {
		
		
		return "meetingroom/meetingroomCurrentStatus";
		
	}

	//예약상세조회용
	@RequestMapping("reserveDetail.me")
	public String reserveDetail(int reservNo, Model model) {
		
		return "meetingroom/meetingroomCurrentStatus";
		
	}
	
	// 내 예약현황리스트조회용
	@RequestMapping("myReserve.me")
	public String myReserveList(String empId, Meetingroom m, Model model) {
		
		return "meetingroom/meetingroomCurrentStatus";
		
	}
	
	// 회의실정보상세조회용(mtroomDetail.me) ---selectMtroomDetail(String mtrmCode,Meetingroom,Model)
	@RequestMapping("mtroomDetail.me")
	public String selectMtroomDetail(Meetingroom m, Model model) {
		
		ArrayList<Meetingroom> list = mrService.selectMtroomDetail();
		
		model.addAttribute("list", list);
		
		
		return "meetingroom/meetingroomManagement";
		
		
	
	}
	
	//회의실등록용(insertMtroom.me) ---insertMeetingroom(Meetingroom,Model)

	@RequestMapping("insertMtroom.me")
	public String insertMeetingroom(Meetingroom m, Model model){
		
		int result = mrService.insertMeetingroom(m);
		System.out.println(m);
		
		model.addAttribute("m", m);
		
		if(result > 0) { // 회의실 등록 성공
			
			return "redirect:mtroomDetail.me?currentPage=1";
		
			
		}else { // 회의글 등록 실패
			
			return "";
		}
	}
	

}









