package com.kh.ergate.meetingroom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.meetingroom.model.service.MeetingroomServiceImpl;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;


@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomServiceImpl mrService;

	// 회의실 예약용 
	@RequestMapping("reserveMtroom.me")
	public String reserveMtroom(MeetingroomReservation mr, HttpSession session) {
		
		int result = mrService.reserveMtroom(mr);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약되었습니다.");
			return "redirect:myReserve.me";
		}else {
			session.setAttribute("msg", "예약 실패하였습니다. 다시 시도해주세요");
			return "redirect:myReserve.me";
		}
	}

	// 현재 예약 조회용
	@RequestMapping("currentStatus.me")
	public String currentStatus(Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}
	// 회의실 예약 현황 리스트 조회용

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Model model) {

		int listCount = mrService.statusListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<MeetingroomReservation> list = mrService.statusList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "meetingroom/meetingroomReservationList";
	}

	// 예약 상세 조회용
	@RequestMapping("reserveDetail.me")
	public String reserveDetail(int reservNo, Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}

	// 내 예약현황 리스트 조회용
	@RequestMapping(value="myReserve.me")
	public void myReserveList(String empId, Model model, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {

		  ArrayList<MeetingroomReservation> list = mrService.myReserveList(empId);
		  
		  model.addAttribute("list", list);
		  
		  response.setContentType("application/json; charset=utf-8");
		  
		  new Gson().toJson(list, response.getWriter());
	}

	// 회의실정보 조회용
	@RequestMapping("mtroomDetail.me")
	public String selectMtroomDetail(Meetingroom m, Model model) {

		ArrayList<Meetingroom> list = mrService.selectMtroomDetail();

		model.addAttribute("list", list);

		return "meetingroom/meetingroomManagement";

	}

	// 회의실 등록용
	@RequestMapping("insertMtroom.me")
	public String insertMeetingroom(Meetingroom m, HttpSession session) {
		
		int result = mrService.insertMeetingroom(m);

		if(result > 0) { 
			session.setAttribute("msg", "성공적으로 회의실이 등록되었습니다.");
			return "redirect:mtroomDetail.me";

		} else {
			session.setAttribute("msg", "회의실 등록에 실패하였습니다. 다시 시도해주세요");
			return "redirect:mtroomDetail.me";
		}
	}
	
	// 회의실수정용
	@RequestMapping("updateMtroom.me")
	public String updateMeetingroom(Meetingroom m, HttpSession session) {
		
		int result = mrService.updateMeetingroom(m);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 회의실 정보가 수정되었습니다.");
			return "redirect:mtroomDetail.me";
			
		}else {
			session.setAttribute("msg", "회의실 정보 수정에 실패하였습니다. 다시 시도해주세요");
			return "redirect:mtroomDetail.me";
		}
		
		
	}
	

}
