package com.kh.ergate.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.schedule.model.vo.Schedule;
import com.kh.ergate.schedule.model.vo.ScheduleCallpeople;
import com.kh.ergate.schedule.model.vo.ScheduleJoinpeople;

@Repository("scDao")
public class ScheduleDao {

	// 일정페이지 불러오는용
	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectScheduleList");
	}
	 // 일정상세조회용
	public Schedule selectScheduleDetail(SqlSessionTemplate sqlSession, int scNo){		
		return sqlSession.selectOne("scheduleMapper.selectScheduleDetail",scNo);
	}
	  //일정 등록-일정
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s){
		return sqlSession.insert("scheduleMapper.insertSchedule", s);
	}
	  //일정등록-참석자 --- 
	public int insertJoin(SqlSessionTemplate sqlSession, ScheduleJoinpeople sjp){
		return sqlSession.insert("scheduleMapper.insertJoin", sjp);
	}
	  //참석자 삭제 --- 
	public int deleteJoin(SqlSessionTemplate sqlSession, ScheduleJoinpeople sjp){
		return 0;
	}
	  //일정등록-수신자 --- 
	public int insertCall(SqlSessionTemplate sqlSession, ScheduleCallpeople scp){
		return sqlSession.insert("scheduleMapper.insertCall", scp);
	}
  	//수신자 삭제 --- 
	public int deleteCall(SqlSessionTemplate sqlSession, ScheduleCallpeople scp){
		return 0;
	}
  	//일정 수정용 --- 
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule sc){
		return sqlSession.update("scheduleMapper.updateSchedule", sc);
	}
  	//일정 삭제용 --- 
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo){
		return sqlSession.delete("scheduleMapper.deleteSchedule", scheduleNo);
	}

}
