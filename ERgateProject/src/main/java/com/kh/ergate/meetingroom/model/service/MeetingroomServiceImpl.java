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
	public ArrayList<MeetingroomReservation> currentStatusList(String date) {
		return mrDao.currentStatusList(sqlSession, date);
	}

	@Override
	public int cancelReserve(int mtrmReserveNo) {
		return mrDao.cancelReserve(sqlSession, mtrmReserveNo);
	}

	@Override
	public int insertMeetingroom(Meetingroom m) {
		return mrDao.insertMeetingroom(sqlSession, m);
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
	public int selectRvListCount(String empId) {
		return mrDao.selectRvListCount(sqlSession, empId);
	}

	// 나의 예약 조회용 서비스
	@Override
	public ArrayList<MeetingroomReservation>myReserveList(String empId, PageInfo pi) {
		return mrDao.myReserveList(sqlSession, empId, pi);
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

	@Override
	public int deleteMeetingroom(Meetingroom m) {
		return mrDao.deleteMeetingroom(sqlSession, m);
	}

	@Override
	public Meetingroom selectMeetingroom(String mtrmCode) {
		return mrDao.selectMeetingroom(sqlSession, mtrmCode);
	}

	@Override
	public ArrayList<MeetingroomReservation> reserveMeetingroomList(String date, PageInfo pi) {
		return mrDao.reserveMeetingroomList(sqlSession, date, pi);
	}

	@Override
	public int reserveMeetingroomListCount(String date) {
		return mrDao.reserveMeetingroomListCount(sqlSession, date);
	}

	@Override
	public ArrayList<MeetingroomReservation> selectCurrentStatus(String currentDate) {
		return mrDao.selectCurrentStatus(sqlSession, currentDate);
	}

	
}
