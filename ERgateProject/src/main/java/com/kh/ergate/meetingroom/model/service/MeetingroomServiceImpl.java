package com.kh.ergate.meetingroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.meetingroom.model.dao.MeetingroomDao;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;


@Service("mrService")
public class MeetingroomServiceImpl implements MeetingroomService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MeetingroomDao mrDao;
	
	
	@Override
	public int currentStatusList() {
		return 0;
	}

	@Override
	public int currentStatusDay(String day) {
		return 0;
	}

	@Override
	public Meetingroom selectPeople() {
		return null;
	}

	@Override
	public int reserveDetail(int reservNo) {
		return 0;
	}

	@Override
	public int cancelReserve(int mtrmReservNo) {
		return 0;
	}

	@Override
	public int insertMeetingroom(Meetingroom m) {
		return 0;
	}



	@Override
	public int updateMeetingroom(Meetingroom m) {
		return 0;
	}

	@Override
	public int deleteMeetingroom(int mtrmCode) {
		return 0;
	}

	//회의실 예약현황 리스트 조회용-
	@Override
	public int statusListCount() {
		return mrDao.statusListCount(sqlSession);
	}


	// 회의실예약현황리스트조회용
	@Override
	public ArrayList<MeetingroomReservation> statusList(MeetingroomReservation mr, PageInfo pi) {
		return mrDao.statusList(sqlSession, pi);
	}
	
	
	
	
	
	
	// 내 예약현황리스트조회용
	@Override
	public ArrayList<MeetingroomReservation> myReserveList(PageInfo pi, String empId) {
		return null;
	}


	@Override
	public ArrayList<Meetingroom> selectMtroomDetail(){
		return mrDao.selectMtroomDetail(sqlSession);
	}

	


	
}
