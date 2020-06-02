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
	
	@ResponseBody
	@RequestMapping(value="empList.gr", produces="application/json; charset=utf-8")
	public String selectEmpList(Model model) {
		
		ArrayList<Employee> list = grService.selectEmpList();
		System.out.println(list);
		model.addAttribute("list", list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="empProfile.gr" )
	public Employee selectEmpProfile(String empId, Model model) {
		
		return grService.selectEmpProfile(empId);
	}
 
}
