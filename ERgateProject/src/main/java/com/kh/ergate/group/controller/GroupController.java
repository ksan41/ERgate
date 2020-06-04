package com.kh.ergate.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ergate.group.model.service.GroupService;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService grService;
	
	@RequestMapping(value="groupList.gr")
	public String selectGroupList(Model model) {
		return "group/groupList";
	}
	
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
		
		System.out.println("c"+empId);
		Employee empPrf = grService.selectEmpProfile(empId);
		
		System.out.println(grService.selectEmpProfile(empId));
		
		return new Gson().toJson(empPrf);
	}
 
}
