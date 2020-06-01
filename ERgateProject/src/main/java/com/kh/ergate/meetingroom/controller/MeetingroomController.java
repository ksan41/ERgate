package com.kh.ergate.meetingroom.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.meetingroom.model.service.MeetingroomService;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;


public class MeetingroomController {

	@Autowired
	private MeetingroomService mrService;
	
	
	/* 할 수 있는 부분부터 해서 주석 참고 바람*/
	
	// 회의실예약현황리스트조회용(statusList.me) --- statusList(Meetingroom,Model)

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Model model) {
		
		int listCount = mrService.statusListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Meetingroom> list = mrService.statusList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "Meetingroom/meetingroomReservationList";
	}
	
	
	
}
