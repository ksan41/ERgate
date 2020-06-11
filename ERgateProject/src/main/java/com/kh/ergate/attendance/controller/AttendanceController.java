package com.kh.ergate.attendance.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ergate.attendance.model.service.AttendanceService;
import com.kh.ergate.attendance.model.vo.Holiday;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService atService;
	
	// ------------- 페이지 이동 -------------
	// 출퇴근내역 리스트 조회용
	@RequestMapping(value="atList.at")
	public String selectAtList(String empId, Model model) {
		return "attendance/attendanceList";
	}
	
	// 근태현황 조회용
	@RequestMapping(value="myStatus.at")
	public String myStatusList(String empId, Model model) {
		return "attendance/attendanceMyStatus";
	}	
	
	// 근태관리 페이지 이동
	@RequestMapping(value="atMgList.at")
	public String selectAtMgList() {
		return "attendance/attendanceManagement";
	}
	
	
	
		
	// ------------- 서비스 요청 -------------
	
	// 근태관리 리스트 조회용 - 첫페이지에 뿌려지는 ajax
	@ResponseBody
	@RequestMapping(value="atMgListAjax.at", produces="application/json; charset=utf-8")
	public String selectAtMgListAjax(String year){
		
		ArrayList<Employee> list = atService.selectAtMgListAjax(year);
		return new Gson().toJson(list);
	}
	
	// 근태관리 부서별 사원 조회 - 가운데 부분 ajax
	@ResponseBody
	@RequestMapping(value="atMgdeptEmpList.gr", produces="application/json; charset=utf-8")
	public String selectAtMgdeptEmpList(Search srch) {
		
		System.out.println(srch);
		ArrayList<Employee> array = atService.selectAtMgdeptEmpList(srch);
		//return new Gson().toJson(array);
		return new GsonBuilder().setDateFormat("yyyy/MM/dd").create().toJson(array);
	}
	
	// 사원별 근태현황 상세 조회용
	@ResponseBody
	@RequestMapping(value="atMgDetail.at", produces="application/json; charset=utf-8")
	public String selectAtMgDetail(Holiday holiday) {
		//System.out.println(holiday);
		ArrayList list = new ArrayList<>();
		Holiday holi = atService.selectHoli(holiday);
		//System.out.println(holi);
		list.add(holi);
		list.add(atService.selectAtMgDetail(holiday)); 
		
		//System.out.println(list);
		return new Gson().toJson(list);
		//return "";
	}
	
	

			

	
}
