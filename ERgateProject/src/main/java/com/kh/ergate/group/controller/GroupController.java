package com.kh.ergate.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ergate.group.model.service.GroupService;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService grService;
	
	
	// ------------- 페이지 이동 -------------
	// 조직도리스트 요청용
	@RequestMapping(value="groupList.gr")
	public String selectGroupList(Model model) {
		return "group/groupList";
	}
	
	// 계정관리페이지 요청용
	@RequestMapping(value="mgList.gr")
	public String electMgList() {
		return "group/groupManagement";
	}
	
	// 승인대기리스트 조회요청용
	@RequestMapping(value="requestList.gr")
	public String selectRequestList() {
		return "group/groupRequestList";
	}
	
	// 사원 계정 수정 페이지 이동
	@RequestMapping(value="empUpdate.gr")
	public String updateGroupEmp() {
		return "group/groupProfileUpdate";
	}
	
	
	
	
	// ------------- 서비스 요청 -------------
	// 조직도 전제 사원 조회
	@ResponseBody
	@RequestMapping(value="empList.gr", produces="application/json; charset=utf-8")
	public String selectEmpList() {
		
		ArrayList<Employee> list = grService.selectEmpList();
		return new Gson().toJson(list);
	}
	
	// 조직도 부서별 사원 조회
	@ResponseBody
	@RequestMapping(value="deptEmpList.gr", produces="application/json; charset=utf-8")
	public String selectDeptEmpList(String keyword) {
		
		ArrayList<Employee> array = grService.selectDeptEmpList(keyword);
		return new Gson().toJson(array);
	}
	
	// 조직도 사원 프로필 조회 (오른쪽 영역)
	@ResponseBody
	@RequestMapping(value="empProfile.gr", produces="application/json; charset=utf-8" )
	public String selectEmpProfile(String empId) {
		
		Employee empPrf = grService.selectEmpProfile(empId);
		return new Gson().toJson(empPrf);
	}
	
	// 조직도 키워드 검색 
	@ResponseBody
	@RequestMapping(value="empListSearch.gr", produces="application/json; charset=utf-8" )
	public String selectEmpListSearch(Search search) {
		
		ArrayList<Employee> array = grService.selectEmpListSearch(search);
		return new Gson().toJson(array);
	}
	
	
	
	
	

	
	
}
