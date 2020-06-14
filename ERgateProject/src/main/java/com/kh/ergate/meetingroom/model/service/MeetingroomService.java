package com.kh.ergate.meetingroom.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomDate;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

public interface MeetingroomService {

	// 현재 예약현황 조회용 --- currentStatusList()
	public ArrayList<MeetingroomReservation> currentStatusList(String date);

	// 회의실 예약용 ---reserveMtroom(MeetingroomReservation,ArrayList<String> empId)
	int reserveMtroom(MeetingroomReservation mr);

	// 예약상세 조회용 ---reserveDetail(int reservNo)
	int reserveDetail(int reservNo);

	// 나의 예약현황 총 개수 조회용 서비스
	int selectRvListCount(String empId);
	
	// 내 예약현황 리스트 조회용 --- myReserveList(String empId)
	ArrayList<MeetingroomReservation> myReserveList(String empId, PageInfo pi);
	
	// 예약취소용---cancelReserve(int mtrmReservNo)
	int cancelReserve(int mtrmReserveNo);

	// 회의실 총 개수 조회용 서비스
	int statusListCount();

	// 회의실 예약현황 리스트 조회용--- statusList(Meetingroom)
	ArrayList<MeetingroomReservation> statusList(PageInfo pi);

	
	public ArrayList<MeetingroomReservation> searchList(String date);
	
	// 회의실 예약현황(관리자쪽)
	public ArrayList<MeetingroomReservation> statusListMonth(String month);

	// 
	ArrayList<MeetingroomReservation> reserveMeetingroomList(String date, PageInfo pi);
	
	// 월별 예약 형황 총 개수 조회용
	int reserveMeetingroomListCount(String date);
	
	// 회의실 등록용 ---insertMeetingroom(Meetingroom)
	int insertMeetingroom(Meetingroom m);

	// 회의실 정보 상세조회용---selectMtroomDetail(String mtrmCode,Meetingroom)
	int selectMtroomDetailListCount();
	
	ArrayList<Meetingroom> selectMtroomDetail(PageInfo pi);

	Meetingroom selectMeetingroom(String mtrmCode);

	// 회의실 수정용---updateMeetingroom(Meetingroom)
	int updateMeetingroom(Meetingroom m);

	// 회의실 삭제용---deleteMeetingroom(int mtrmCode)
	int deleteMeetingroom(Meetingroom m);


}
