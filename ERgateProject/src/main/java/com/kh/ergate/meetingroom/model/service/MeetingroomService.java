package com.kh.ergate.meetingroom.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

public interface MeetingroomService {



	 //현재 예약현황 조회용 --- currentStatusList()
		int currentStatusList();
		
	 //날짜선택 예약현황 조회용 --- currentStatusDay(String day)
		int currentStatusDay(String day);
		
	 //회의실 예약용 ---reserveMtroom(MeetingroomReservation,ArrayList<String> empId)
	
	 //참석자 팝업 조회용 ---selectPeople()
		Meetingroom selectPeople();
	
	 //참석자 검색용 ---searchPeople(String condition,String keyword)
		
	 //참석자 등록용--- insertPeople(ArrayList<String>)
		
	 //예약상세 조회용 ---reserveDetail(int reservNo)
		int reserveDetail(int reservNo);
		
	 //내 예약현황 리스트 조회용 --- myReserveList(String empId)
		
		ArrayList<MeetingroomReservation> myReserveList(PageInfo pi, String empId);
		
		
	 //예약취소용---cancelReserve(int mtrmReservNo)
		int cancelReserve(int mtrmReservNo);

	 /* =========================관리자 입장에서 관리하는 페이지  service==================================== */

	// 회의실 총 개수 조회용 서비스
		int statusListCount();
		
	 //회의실 예약현황 리스트 조회용--- statusList(Meetingroom)
		ArrayList<MeetingroomReservation> statusList(MeetingroomReservation mr, PageInfo pi);
		
		
		
	 //회의실 예약현황 월 선택 조회용 ---statusListMonth(String month)
	 //회의실 관리리스트 조회용---meetingroomList()

	 //회의실 등록용 ---insertMeetingroom(Meetingroom)
		int insertMeetingroom(Meetingroom m);
		
	 //회의실 정보 상세조회용---selectMtroomDetail(String mtrmCode,Meetingroom)
		ArrayList<Meetingroom> selectMtroomDetail();
		
	 //회의실 수정용---updateMeetingroom(Meetingroom)
		int updateMeetingroom(Meetingroom m);
		
	 //회의실 삭제용---deleteMeetingroom(int mtrmCode) 
		int deleteMeetingroom(int mtrmCode);
	
}
