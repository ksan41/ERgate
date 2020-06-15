package com.kh.ergate.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ergate.attendance.model.service.AttendanceService;
import com.kh.ergate.attendance.model.vo.Holiday;
import com.kh.ergate.attendance.model.vo.UseHoliday;
import com.kh.ergate.attendance.model.vo.WorkRecord;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.schedule.model.vo.Schedule;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService atService;
	
	// ------------- 페이지 이동 -------------
	// 출퇴근내역 리스트 조회용
	@RequestMapping(value="atList.at")
	public ModelAndView selectAtList() {
		ArrayList<WorkRecord> wrlist = atService.selectAtList();		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attendance/attendanceList");
		mv.addObject("wrlist", wrlist);
		return mv;
	}
	
	// 근태현황 조회용
	@RequestMapping(value="myStatus.at")
	public ModelAndView myStatusList() {
		ArrayList<UseHoliday> uhlist = atService.myStatusList();	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attendance/attendanceMyStatus");
		mv.addObject("uhlist", uhlist);
		return mv;
		
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
	
	 //출근요청용(clockIn.at) ---
	@ResponseBody
	@RequestMapping(value="startTime.at", produces="application/json; charset=utf-8")
	 public String clockInAt(HttpSession session,Model model, WorkRecord wr){
		
			
			int result = atService.clockInAt(wr);			
			if(result > 0) {  // 출석 성공
				
				session.setAttribute("msg2", "출근 활기찬하루되세요.");
				return "redirect:/atList.at";
				
			}else {  // 일정등록 실패
				
				model.addAttribute("msg", "일정등록실패");
				return "common/errorPage";
				
			}
	 }
	 
	 //퇴근요청용(clockOut.at) ---
	@ResponseBody
	@RequestMapping(value="endTime.at", produces="application/json; charset=utf-8")
	 public String clockOutAt(WorkRecord wr,HttpSession session,Model model){
		
		
		 int result = atService.clockOutAt(wr);	
		 
		if(result > 0) {  // 퇴근 성공
			
			session.setAttribute("msg2", "퇴근 오늘도고생하셨습니다.");
			return "redirect:/atList.at";
			
		}else {  // 일정등록 실패
			
			model.addAttribute("msg", "퇴근 실패");
			return "common/errorPage";
			
		}
	}


			

	
}
