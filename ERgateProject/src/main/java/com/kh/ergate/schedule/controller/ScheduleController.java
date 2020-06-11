package com.kh.ergate.schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ergate.schedule.model.service.ScheduleService;
import com.kh.ergate.schedule.model.vo.Schedule;
import com.kh.ergate.schedule.model.vo.ScheduleCallpeople;
import com.kh.ergate.schedule.model.vo.ScheduleJoinpeople;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	
	
	// 스케줄 페이지로 이동
	@RequestMapping("selectList.sc")
	public ModelAndView scheduleMain() {
		ArrayList<Schedule> slist = sService.selectScheduleList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("schedule/scheduleMain");
		mv.addObject("slist", slist);
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule s, Model model,ScheduleJoinpeople sjp, ScheduleCallpeople scp,HttpSession session) {
		 if(s.getScheduleKind().equals("개인일정") || s.getScheduleKind().equals("공유일정")){
			 int result=sService.insertSchedule(s);
			if(result > 0) { // 인설트성공				
				session.setAttribute("msg", "일정등록 성공!!");
				return "redirect:/";
				
			}else {  // 인설트실패
				
				model.addAttribute("msg", "인설트 실패!!");
				return "common/errorPage";				
			} 
		 }else if(s.getScheduleKind().equals("업무일정")) {
			 int result=sService.insertSchedule(s);
			 int resultC =sService.insertCall(scp); 
			 int resultJ=sService.insertJoin(sjp);
			 if(result >0 || resultC >0 || resultJ>0) {
				 session.setAttribute("msg", "일정등록 성공!!");
				return "redirect:/";				
				 
			 }else {  // 인설트실패
					
					model.addAttribute("msg", "인설트 실패!!");
					return "common/errorPage";				
			} 
		}
		
		 return "redirect:/";
		
	}
	
	
	  @ResponseBody	  
	  @RequestMapping(value="slist.bo", produces="application/json; charset=utf-8")
	  public String selectScheduleDetail(String scheduleNo){		
		  int scNo=Integer.parseInt(scheduleNo);			
		  Schedule sc = sService.selectScheduleDetail(scNo);		 
		  return  new Gson().toJson(sc);		 
	  
	  }
	  
	  @ResponseBody
	  @RequestMapping("update.sc")
	  public String updateSchedule(Schedule sc, Model model, HttpSession session) {
	
		  int result = sService.updateSchedule(sc);
		  
		  if(result > 0) {  // 수정 성공
			  
			  session.setAttribute("loginUser", sService.selectScheduleDetail(sc.getScheduleNo() ));
			  
			  return "redirect:selectList.sc";
			  
		  }else {  // 수정 실패
			  
			  model.addAttribute("msg", "일정 정보 수정 실패!!");
			  return "common/errorPage";
			  
		  }
		  
		  
	  }
	  
	  @RequestMapping("delete.sc")
	  public String deleteSchedule(int ScheduleNo, Model model, HttpSession session) {
		  
		  int result = sService.deleteSchedule(ScheduleNo);
		  
		  if(result > 0) {
			  
			  session.invalidate();
			  return "redirect:selectList.sc";
			  
		  }else {
			  
			  model.addAttribute("msg", "일정 삭제 실패!!!!");
			  return "common/errorPage";
		  }
	  }
	  
	 
}
