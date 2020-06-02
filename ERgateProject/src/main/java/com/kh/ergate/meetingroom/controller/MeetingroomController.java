package com.kh.ergate.meetingroom.controller;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.meetingroom.model.service.MeetingroomService;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;

//어노테이션을 통해 bean으로 등록(내부적으로 HandlerMapping이 됨)
@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomService mrService;
	
	
	/* 할 수 있는 부분부터 해서 주석 참고 바람*/
	
	// 회의실예약현황리스트조회용(statusList.me) --- statusList(Meetingroom,Model)

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Meetingroom m, Model model) {
		
		
		  int listCount = mrService.statusListCount();
		  
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		  
		  ArrayList<Meetingroom> list = mrService.statusList(pi);
		  
		  model.addAttribute("pi", pi); model.addAttribute("list", list);
		 
		
		
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
	public String selectMtroomDetail(String mtrmCode, Meetingroom m, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Meetingroom> list = mrService.selectMtroomDetail(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "meetingroom/meetingroomReservationList";
		
		
	
	}
	

}









