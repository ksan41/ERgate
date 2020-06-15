package com.kh.ergate.meetingroom.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomDate;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

public interface MeetingroomService {
	
	// 업무차량 예약 현황 조회용 서비스 (일별)
	public ArrayList<MeetingroomReservation> currentStatusList(String date);
	
	// 나의 예약 현황 총 개수 조회용 서비스
	int selectReserveListCount(String empId);
	
	// 내 예약 조회용 서비스 ajax
	ArrayList<MeetingroomReservation> myReserveMeetingroom(String empId, PageInfo pi);
	
	// 차량 예약 현황 조회용 서비스 (일별)
	ArrayList<MeetingroomReservation> selectCurrentStatus(String currentDate);
	
	// 차량 예약용 서비스
	int reserveMeetingroom(MeetingroomReservation mr);
	
	// 차량 예약 취소용 서비스
	int cancelReserveMeetingroom(int mtrmReserveNo);
	
	// 차량 예약 현황 조회용 서비스 (월별) - 관리자
	ArrayList<MeetingroomReservation> reserveMeetingroomList(String date, PageInfo pi);
	
	// 월별 예약 현황 총 개수 조회용 서비스
	int reserveMeetingroomListCount(String date);
	
	// 차량 리스트 총 개수 조회용 서비스
	int selectMeetingroomListCount();
	
	// 차량 리스트 조회용 서비스 - 관리자
	ArrayList<Meetingroom> selectMeetingroomList(PageInfo pi);
	
	// 차량 등록용 서비스 - 관리자
	int insertMeetingroom(Meetingroom m);
	
	// 차량 상세 조회용 서비스 - 관리자
	Meetingroom selectMeetingroom(String mtrmCode);
	
	// 차량 수정용 서비스 - 관리자
	int updateMeetingroom(Meetingroom m);
	
	// 차량 삭제용 서비스 - 관리자
	int deleteMeetingroom(Meetingroom m);

}
