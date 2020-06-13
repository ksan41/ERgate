package com.kh.ergate.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.attendance.model.dao.AttendanceDao;
import com.kh.ergate.attendance.model.vo.Holiday;
import com.kh.ergate.attendance.model.vo.WorkRecord;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

@Service("atService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao atDao;

	@Override
	public Holiday selectEmpHoliday(Holiday holiday) {
		return atDao.selectEmpHoliday(sqlSession, holiday);
	}

	@Override
	public ArrayList<Employee> selectAtMgListAjax(String year) {
		return atDao.selectAtMgListAjax(sqlSession, year);
	}

	@Override
	public ArrayList<Employee> selectAtMgdeptEmpList(Search srch) {
		return atDao.selectAtMgdeptEmpList(sqlSession, srch);
	}
	
	@Override
	public ArrayList<Holiday> selectAtMgDetail(Holiday holiday) {
		return atDao.selectAtMgDetail(sqlSession, holiday);
	}

	@Override
	public Holiday selectHoli(Holiday holiday) {
		return atDao.selectHoli(sqlSession, holiday);
	}
	@Override
	public ArrayList<WorkRecord> selectAtList() {
		
		return atDao.selectAtList(sqlSession);
	}
	@Override
	public int clockInAt(WorkRecord wr) {		
		return atDao.clockInAt(sqlSession, wr);
	}
	@Override
	public int clockOutAt(WorkRecord wr) {		
		return atDao.clockOutAt(sqlSession, wr);
	}
}
