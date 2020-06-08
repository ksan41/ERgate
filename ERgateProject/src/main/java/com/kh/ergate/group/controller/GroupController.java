package com.kh.ergate.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	// 1. 조직도리스트 요청용
	@RequestMapping(value="groupList.gr")
	public String selectGroupList(Model model) {
		return "group/groupList";
	}
	
	// 2. 계정관리페이지 요청용
	@RequestMapping(value="mgList.gr")
	public String selectMgList() {
		return "group/groupManagement";
	}
	

	
	
	
	// ------------- 서비스 요청 -------------
	// 3. 조직도 전제 사원 조회
	@ResponseBody
	@RequestMapping(value="empList.gr", produces="application/json; charset=utf-8")
	public String selectEmpList() {
		
		ArrayList<Employee> list = grService.selectEmpList();
		return new Gson().toJson(list);
	}
	
	// 4. 조직도 부서별 사원 조회
	@ResponseBody
	@RequestMapping(value="deptEmpList.gr", produces="application/json; charset=utf-8")
	public String selectDeptEmpList(String keyword) {
		
		ArrayList<Employee> array = grService.selectDeptEmpList(keyword);
		return new Gson().toJson(array);
	}
	
	// 5. 조직도 사원 프로필 조회 (오른쪽 영역)
	@ResponseBody
	@RequestMapping(value="empProfile.gr", produces="application/json; charset=utf-8" )
	public String selectEmpProfile(String empId) {
		
		Employee empPrf = grService.selectEmpProfile(empId);
		return new Gson().toJson(empPrf);
	}
	
	// 6. 조직도 키워드 검색 
	@ResponseBody
	@RequestMapping(value="empListSearch.gr", produces="application/json; charset=utf-8" )
	public String selectEmpListSearch(Search search) {
		
		ArrayList<Employee> array = grService.selectEmpListSearch(search);
		return new Gson().toJson(array);
	}
	
	// 7. 승인대기리스트 조회요청용
	@RequestMapping(value="requestList.gr")
	public String selectRequestList(Model model) {
		
		ArrayList<Employee> array = grService.selectRequestList();
		model.addAttribute("requestList", array);
		
		return "group/groupRequestList";
	}
	
	// 8. 승인대기 사원 프로필 상세 요청용
	@RequestMapping(value="requestDetail.gr")
	public String selectGroupRequestDetail(String empId, Model model) {

		Employee empPrf = grService.selectGroupRequestDetail(empId);
		model.addAttribute("empPrf", empPrf);
		return "group/groupRequestDetail";
	}
	
	// 8_1. 계정 승인 요청 
	@RequestMapping(value="requestEmp.gr")
	public String groupRequestDetail(Employee emp, Model model, HttpSession session) {
	
		System.out.println(emp);
		int result = grService.updateGroupEmp(emp);
		if(result>0) {
			model.addAttribute("empPrfUpdateSuccess", emp);
			session.setAttribute("msg", "계정을 승인했습니다.");
			return "redirect:requestList.gr";
		}else {
			session.setAttribute("msg", "계정 승인을 실패하였습니다. 다시 시도해 주세요.");
			return "group/groupRequestDetail";
		}
	}
	
	// 9. 사원 계정 수정 상세 페이지
	@RequestMapping(value="groupProfileUpdateDetail.gr")
	public String updateGroupEmpDetail(String empId, Model model) {
		
		Employee empPrf = grService.selectEmpProfile(empId);
		//System.out.println(empPrf);
		model.addAttribute("empPrf", empPrf);
		return "group/groupProfileUpdate";
	}
	
	// 9_1. 사원 계정 수정 요청 
	@RequestMapping("groupProfileUpdate.gr")
	public String updateGroupEmp(Employee emp, Model model, HttpSession session) {
		
		//System.out.println(emp);
		int result = grService.updateGroupEmp(emp);
		if(result>0) {
			model.addAttribute("empPrfUpdateSuccess", emp);
			session.setAttribute("msg", "계정 등록 수정이 성공적으로 완료되었습니다.");
			return "redirect:mgList.gr";
		}else {
			session.setAttribute("msg", "계정 등록 요청에 실패하였습니다. 다시 시도해 주세요.");
			return "mgList.gr";
		}
		
	}

	// 10. 계정승인 거절용
	@RequestMapping("noUpdate.gr")
	public String noUpdateGroupEmp(String empId, HttpSession session) {
		// System.out.println(empId);
		int result = grService.noUpdateGroupEmp(empId);
		if(result>0) {
			session.setAttribute("msg", "계정 승인을 거절했습니다.");
			return "redirect:requestList.gr";
		} else {
			session.setAttribute("msg", "계정 삭제에 실패하였습니다. 다시 시도해 주세요.");
			return "requestList.gr";
		}
	}

	
	
}
