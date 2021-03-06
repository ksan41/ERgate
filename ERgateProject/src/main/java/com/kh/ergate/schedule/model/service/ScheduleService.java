package com.kh.ergate.schedule.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ergate.notice.model.vo.Notice;
import com.kh.ergate.schedule.model.vo.Schedule;


public interface ScheduleService {
	 
	 //일정페이지 불러오는용
	 public ArrayList<Schedule> selectScheduleList();
	
	  //일정상세조회용 
	 public Schedule selectScheduleDetail(int scNo);
	  
	  //일정 등록-일정 
	  public int insertSchedule(Schedule s);
	  
	  //일정 수정용  
	  public int updateSchedule(Schedule sc);
	 
	  //일정 삭제용 -
	  public int deleteSchedule(int scheduleNo);


}
