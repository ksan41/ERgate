package com.kh.ergate.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.schedule.model.dao.ScheduleDao;
import com.kh.ergate.schedule.model.vo.Schedule;
import com.kh.ergate.schedule.model.vo.ScheduleCallpeople;
import com.kh.ergate.schedule.model.vo.ScheduleJoinpeople;

@Service("scService")
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scDao;
	
	//일정페이지 불러오는용
	@Override
	 public ArrayList<Schedule> selectScheduleList(){
		return scDao.selectScheduleList(sqlSession);
	};
	
	  //일정상세조회용 
	@Override
	 public Schedule selectScheduleDetail(int scNo) {		
		return scDao.selectScheduleDetail(sqlSession, scNo);
	};
	  
	  //일정 등록-일정 
	@Override
	  public int insertSchedule(Schedule s) {
		return scDao.insertSchedule(sqlSession, s);
	};
	  
	  
	  //일정 수정용  
	@Override
	  public int updateSchedule(Schedule sc) {
		return scDao.updateSchedule(sqlSession, sc);
	};
	 
	  //일정 삭제용 
	@Override
	  public int deleteSchedule(int scheduleNo) {
		return scDao.deleteSchedule(sqlSession, scheduleNo);
	};
	
	
}
