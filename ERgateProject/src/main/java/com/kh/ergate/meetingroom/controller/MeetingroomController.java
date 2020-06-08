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

//어노테이션을 통해 bean으로 등록(내부적으로 HandlerMapping이 됨)
@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomServiceImpl mrService;

	/* 할 수 있는 부분부터 해서 주석 참고 바람 */

	// 회의실 예약용 

	@RequestMapping("reserveMtroom.me")
	public String reserveMtroom(MeetingroomReservation mr, HttpSession session) {
		
		int result = mrService.reserveMtroom(mr);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약되었습니다.");
			return "redirect:myReserve.me?currentPage=1";
		}else {
			session.setAttribute("msg", "예약 실패하였습니다. 다시 시도해주세요");
			return "redirect:myReserve.me?currentPage=1";
		}
	}

	// 현재 예약 조회용
	@RequestMapping("currentStatus.me")
	public String currentStatus(Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}

	// 회의실예약현황리스트조회용(statusList.me) --- statusList(Meetingroom,Model)

	@RequestMapping("statusList.me")
	public String statusList(int currentPage, Model model) {

		int listCount = mrService.statusListCount();

		// System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);

		ArrayList<MeetingroomReservation> list = mrService.statusList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "meetingroom/meetingroomReservationList";
	}

	// 예약상세조회용
	@RequestMapping("reserveDetail.me")
	public String reserveDetail(int reservNo, Model model) {

		return "meetingroom/meetingroomCurrentStatus";

	}

	// 내 예약현황 리스트 조회용

	//@ResponseBody
	@RequestMapping(value="myReserve.me")
	public void myReserveList(String empId, Model model, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {

		  ArrayList<MeetingroomReservation> list = mrService.myReserveList(empId);
		  
		  model.addAttribute("list", list);
		  System.out.println(list);
		  
		  response.setContentType("application/json; charset=utf-8");
		  
		  new Gson().toJson(list, response.getWriter());
	}

	// 회의실정보 조회용(mtroomDetail.me) ---selectMtroomDetail(String
	@RequestMapping("mtroomDetail.me")
	public String selectMtroomDetail(Meetingroom m, Model model) {

		ArrayList<Meetingroom> list = mrService.selectMtroomDetail();

		model.addAttribute("list", list);

		return "meetingroom/meetingroomManagement";

	}

	// 회의실등록용(insertMtroom.me) ---insertMeetingroom(Meetingroom,Model)

	@RequestMapping("insertMtroom.me")
	public String insertMeetingroom(Meetingroom m, HttpServletRequest request) {
		System.out.println(m);
		
		int result = mrService.insertMeetingroom(m);

		if(result > 0) { // 회의실 등록 성공

			return "redirect:mtroomDetail.me?currentPage=1";
			//return "meetingroom/meetingroomManagement";
		} else { // 회의글 등록 실패

			return "";
		}
	}
	
	// 회의실수정용(updateMtroom.me) ---updateMeetingroom(Meetingroom,Model)
	
	@RequestMapping("updateMtroom.me")
	public String updateMeetingroom(Meetingroom m, Model model) {
		
		int result = mrService.updateMeetingroom(m);
		
		if(result > 0) {
			
			return "redirect:mtroomDetail.me?mno=";
			
		}else {
			model.addAttribute("msg", "게시글 수정 실패");
		}
		return null;
		
	}
	

}
