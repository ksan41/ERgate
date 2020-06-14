package com.kh.ergate.meetingroom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomDate;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;
import com.kh.ergate.vehicle.model.vo.VehicleReservation;

@Repository("mrDao")
public class MeetingroomDao {

	public int statusListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingroomMapper.statusListCount");
	}
	
	public ArrayList<MeetingroomReservation> currentStatusList(SqlSessionTemplate sqlSession, String date){
		return (ArrayList)sqlSession.selectList("meetingroomMapper.currentStatusList", date);
	}
	
	public ArrayList<MeetingroomReservation> statusList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("meetingroomMapper.statusList", null, rowBounds);
		
	}
	
	public int selectMtroomDetailListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingroomMapper.selectMtroomDetailListCount");
	}
	
	public ArrayList<Meetingroom> selectMtroomDetail(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.selectMtroomDetail", null, rowBounds);
	}
	
	public int reserveMtroom(SqlSessionTemplate sqlSession, MeetingroomReservation mr) {
		return sqlSession.insert("meetingroomMapper.reserveMtroom", mr);
	}
	
	public int insertMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.insert("meetingroomMapper.insertMeetingroom", m);
	}

	public int selectRvListCount(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("meetingroomMapper.selectRvListCount", empId);
	}
	
	public ArrayList<MeetingroomReservation> myReserveList(SqlSessionTemplate sqlSession, String empId, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.myReserveList", empId, rowBounds);
	}

	public int updateMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.update("meetingroomMapper.updateMeetingroom", m);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, String month) {
		return sqlSession.selectOne("meetingroomMapper.searchListCount", month);
	}
	
	public ArrayList<MeetingroomReservation> searchList(SqlSessionTemplate sqlSession, String date){
		return (ArrayList)sqlSession.selectList("meetingroomMapper.searchList", date);
	}
	
	public int cancelReserve(SqlSessionTemplate sqlSession, int mtrmReserveNo) {
		return sqlSession.update("meetingroomMapper.cancelReserve", mtrmReserveNo);
	}
	
	public ArrayList<MeetingroomReservation> statusListMonth(SqlSessionTemplate sqlSession, String month){
		return (ArrayList)sqlSession.selectList("meetingroomMapper.searchList", month);
	}
	
	public int deleteMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.update("meetingroomMapper.deleteMeetingroom", m);
	}
	
	public Meetingroom selectMeetingroom(SqlSessionTemplate sqlSession, String mtrmCode) {
		return sqlSession.selectOne("meetingroomMapper.selectMeetingroom", mtrmCode);
	}

	public ArrayList<MeetingroomReservation> reserveMeetingroomList(SqlSessionTemplate sqlSession, String date, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.reserveMeetingroomList", date, rowBounds);
	}
	
	public int reserveMeetingroomListCount(SqlSessionTemplate sqlSession, String date) {
		return sqlSession.selectOne("meetingroomMapper.reserveMeetingroomListCount", date);
	}


}