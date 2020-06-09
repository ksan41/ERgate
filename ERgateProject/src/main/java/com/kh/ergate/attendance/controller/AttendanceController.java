package com.kh.ergate.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.attendance.model.service.AttendanceService;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService atService;
	
	// ------------- 페이지 이동 -------------
	// 출퇴근내역리스트조회용
	@RequestMapping(value="atList.at")
	public String selectAtList(String empId, Model model) {
		return "attendance/attendanceList";
	}
	
	// 근태현황조회용
	@RequestMapping(value="myStatus.at")
	public String myStatusList(String empId, Model model) {
		return "attendance/attendanceMyStatus";
	}
	
	// 근태관리 리스트 조회용
	@RequestMapping(value="atMgList.at")
	public String selectAtMgList(Model model) {
		return "attendance/attendanceManagement";
	}
			

	
}
