package com.kh.ergate.meetingroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.meetingroom.model.dao.MeetingroomDao;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomDate;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

@Service("mrService")
public class MeetingroomServiceImpl implements MeetingroomService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MeetingroomDao mrDao;


	// 업무차량 예약 현황 조회용 서비스 (일별)
	@Override
	public ArrayList<MeetingroomReservation> currentStatusList(String date) {
		return mrDao.currentStatusList(sqlSession, date);
	}
	
	// 나의 예약 현황 총 개수 조회용 서비스
	@Override
	public int selectReserveListCount(String empId) {
		return mrDao.selectReserveListCount(sqlSession, empId);
	}
	
	// 내 예약 조회용 서비스 ajax
	@Override
	public ArrayList<MeetingroomReservation> myReserveMeetingroom(String empId, PageInfo pi) {
		return mrDao.myReserveMeetingroom(sqlSession, empId, pi);
	}
		
	// 차량 예약 현황 조회용 서비스 (일별)
	@Override
	public ArrayList<MeetingroomReservation> selectCurrentStatus(String currentDate) {
		return mrDao.selectCurrentStatus(sqlSession, currentDate);
	}

	// 차량 예약용 서비스
	@Override
	public int reserveMeetingroom(MeetingroomReservation vr) {
		return mrDao.reserveMeetingroom(sqlSession, vr);
	}

	// 차량 예약 취소용 서비스
	@Override
	public int cancelReserveMeetingroom(int mtrmReserveNo) {
		return mrDao.cancelReserveMeetingroom(sqlSession, mtrmReserveNo);
	}

	// 차량 예약 현황 조회용 서비스 (월별) - 관리자
	@Override
	public ArrayList<MeetingroomReservation> reserveMeetingroomList(String date, PageInfo pi) {
		return mrDao.reserveMeetingroomList(sqlSession, date, pi);
	}

	// 월별 예약 현황 총 개수 조회용 서비스
	@Override
	public int reserveMeetingroomListCount(String date) {
		return mrDao.reserveMeetingroomListCount(sqlSession, date);
	}
	
	// 차량 리스트 총 개수 조회용 서비스
	@Override
	public int selectMeetingroomListCount() {
		return mrDao.selectMeetingroomListCount(sqlSession);
	}

	// 차량 리스트 조회용 서비스 - 관리자
	@Override
	public ArrayList<Meetingroom> selectMeetingroomList(PageInfo pi) {
		return mrDao.selectMeetingroomList(sqlSession, pi);
	}

	// 차량 등록용 서비스 - 관리자
	@Override
	public int insertMeetingroom(Meetingroom m) {
		return mrDao.insertMeetingroom(sqlSession, m);
	}
	
	// 차량 상세 조회용 서비스 - 관리자
	@Override
	public Meetingroom selectMeetingroom(String mtrmCode) {
		return mrDao.selectMeetingroom(sqlSession, mtrmCode);
	}

	// 차량 수정용 서비스 - 관리자
	@Override
	public int updateMeetingroom(Meetingroom m) {
		return mrDao.updateMeetingroom(sqlSession, m);
	}

	// 차량 삭제용 서비스 - 관리자
	@Override
	public int deleteMeetingroom(Meetingroom m) {
		return mrDao.deleteMeetingroom(sqlSession, m);
	}

}
