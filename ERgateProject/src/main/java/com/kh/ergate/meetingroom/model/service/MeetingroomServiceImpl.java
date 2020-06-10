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

	@Override
	public int currentStatusList() {
		return 0;
	}
	


	@Override
	public ArrayList<MeetingroomReservation> searchListt(MeetingroomDate md) {
		return mrDao.searchListt();
	}

	@Override
	public int currentStatusDay(MeetingroomDate md) {
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
		return mrDao.cancelReserve(sqlSession, mtrmReservNo);
	}

	@Override
	public int insertMeetingroom(Meetingroom m) {
		return mrDao.insertMeetingroom(sqlSession, m);
	}

	@Override
	public int deleteMeetingroom(int mtrmCode) {
		return 0;
	}

	// 회의실 예약현황 리스트 조회용-
	@Override
	public int statusListCount() {
		return mrDao.statusListCount(sqlSession);
	}

	// 회의실예약현황리스트조회용
	@Override
	public ArrayList<MeetingroomReservation> statusList(PageInfo pi) {
		return mrDao.statusList(sqlSession, pi);
	}



	// 회의실 예약용
	@Override
	public int reserveMtroom(MeetingroomReservation mr) {
		return mrDao.reserveMtroom(sqlSession, mr);
	}

	// 회의실 수정용
	@Override
	public int updateMeetingroom(Meetingroom m) {
		return mrDao.updateMeetingroom(sqlSession, m);
	}

	// 나의 예약 현황 총 개수 조회용 서비스
	@Override
	public int selectRvListCount() {
		return mrDao.selectRvListCount(sqlSession);
	}

	// 나의 예약 조회용 서비스
	@Override
	public ArrayList<MeetingroomReservation>myReserveList(String empId) {
		return mrDao.myReserveList(sqlSession, empId);
	}
	/*
	 * @Override public int seachListCount(String month) { return
	 * mrDao.seachListCount(sqlSession, month); }
	 */

	@Override
	public int seachListCount(String month) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MeetingroomReservation> searchList(String date) {
		return mrDao.searchList(sqlSession, date);
	}

	@Override
	public ArrayList<MeetingroomReservation> statusListMonth(String month) {
		return mrDao.statusListMonth(sqlSession, month);
	}


	// 회의실 리스트 조회용 서비스 -관리자
	@Override
	public int selectMtroomDetailListCount() {
		return mrDao.selectMtroomDetailListCount(sqlSession);
	}

	@Override
	public ArrayList<Meetingroom> selectMtroomDetail(PageInfo pi) {
		return mrDao.selectMtroomDetail(sqlSession, pi);
	}


}
