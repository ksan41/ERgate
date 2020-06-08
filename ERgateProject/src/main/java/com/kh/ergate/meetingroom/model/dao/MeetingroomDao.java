package com.kh.ergate.meetingroom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.Meetingroom;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;

@Repository("mrDao")
public class MeetingroomDao {

	public int statusListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingroomMapper.statusListCount");
	}
	
	public ArrayList<MeetingroomReservation> statusList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("meetingroomMapper.statusList", null, rowBounds);
		
	}
	
	public ArrayList<Meetingroom> selectMtroomDetail(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("meetingroomMapper.selectMtroomDetail");
	}
	
	public int reserveMtroom(SqlSessionTemplate sqlSession, MeetingroomReservation mr) {
		return sqlSession.insert("meetingroomMapper.reserveMtroom", mr);
	}
	
	public int insertMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.insert("meetingroomMapper.insertMeetingroom", m);
	}

	public int selectRvListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingroomMapper.selectRvListCount");
	}
	
	public ArrayList<MeetingroomReservation> myReserveList(SqlSessionTemplate sqlSession, String empId){
		//int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		//RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("meetingroomMapper.myReserveList", empId);
	}

	public int updateMeetingroom(SqlSessionTemplate sqlSession, Meetingroom m) {
		return sqlSession.update("meetingroomMapper.updateMeetingroom", m);
	}
	
	
	
}