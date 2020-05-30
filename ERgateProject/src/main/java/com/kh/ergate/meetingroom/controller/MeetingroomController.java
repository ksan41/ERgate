package com.kh.ergate.meetingroom.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.meetingroom.model.service.MeetingroomService;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;


public class MeetingroomController {

	@Autowired
	private MeetingroomService mrService;
	
	
	/* 할 수 있는 부분부터 해서 주석 참고 바람*/
	
	// 회의실예약현황리스트조회용(statusList.me) --- statusList(Meetingroom,Model)

	@RequestMapping("statusList.me")
	public String statusList(Meetingroom m, Model model) {
		
		
		
		return "";
	}
	
	
	
}
