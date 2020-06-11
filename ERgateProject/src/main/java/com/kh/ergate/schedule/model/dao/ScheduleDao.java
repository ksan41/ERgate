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
	
  	//일정 수정용 --- 
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule sc){
		return sqlSession.update("scheduleMapper.updateSchedule", sc);
	}
  	//일정 삭제용 --- 
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo){
		return sqlSession.delete("scheduleMapper.deleteSchedule", scheduleNo);
	}

}
