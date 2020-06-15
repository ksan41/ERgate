package com.kh.ergate.meetingroom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

@Repository("mrDao")
public class MeetingroomDao {

	public ArrayList<MeetingroomReservation> currentStatusList(SqlSessionTemplate sqlSession, String date){
		return (ArrayList)sqlSession.selectList("meetingroomMapper.currentStatusList", date);
	}
	
	public int selectReserveListCount(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("meetingroomMapper.selectReserveListCount", empId);
	}
	
	public ArrayList<MeetingroomReservation> myReserveMeetingroom(SqlSessionTemplate sqlSession, String empId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.myReserveMeetingroom", empId, rowBounds);
	}
	
	public ArrayList<MeetingroomReservation> selectCurrentStatus(SqlSessionTemplate sqlSession, String currentDate) {
		return (ArrayList)sqlSession.selectList("meetingroomMapper.selectCurrentStatus", currentDate);
	}
	
	public int reserveMeetingroom(SqlSessionTemplate sqlSession, MeetingroomReservation mr) {
		return sqlSession.insert("meetingroomMapper.reserveMeetingroom", mr);
	}
	
	public int cancelReserveMeetingroom(SqlSessionTemplate sqlSession, int mtrmReserveNo) {
		return sqlSession.update("meetingroomMapper.cancelReserveMeetingroom", mtrmReserveNo);
	}
	
	public ArrayList<MeetingroomReservation> reserveMeetingroomList(SqlSessionTemplate sqlSession, String date, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.reserveMeetingroomList", date, rowBounds);
	}
	
	public int reserveMeetingroomListCount(SqlSessionTemplate sqlSession, String date) {
		return sqlSession.selectOne("meetingroomMapper.reserveMeetingroomListCount", date);
	}
	
	public int selectMeetingroomListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingroomMapper.selectMeetingroomListCount");
	}
	
	public ArrayList<Meetingroom> selectMeetingroomList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.selectMeetingroomList", null, rowBounds);
	}
	
	public Meetingroom selectMeetingroom(SqlSessionTemplate sqlSession, String mtrmCode) {
		return sqlSession.selectOne("meetingroomMapper.selectMeetingroom", mtrmCode);
	}
	
	public int insertMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.insert("meetingroomMapper.insertMeetingroom", m);
	}
	
	public int updateMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.update("meetingroomMapper.updateMeetingroom", m);
	}
	
	public int deleteMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.update("meetingroomMapper.deleteMeetingroom", m);
	}
	
}
