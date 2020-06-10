package com.kh.ergate.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.attendance.model.vo.Holiday;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

@Repository("atDao")
public class AttendanceDao {

	public ArrayList<Holiday> selectAtMgDetail(SqlSessionTemplate sqlSession, Holiday holiday) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAtMgDetail", holiday);
	}

	public Holiday selectEmpHoliday(SqlSessionTemplate sqlSession, Holiday holiday) {
		return sqlSession.selectOne("attendanceMapper.selectEmpHoliday", holiday);
	}

	public ArrayList<Employee> selectAtMgListAjax(SqlSessionTemplate sqlSession, String year) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAtMgListAjax", year);
	}

	public ArrayList<Employee> selectAtMgdeptEmpList(SqlSessionTemplate sqlSession, Search srch) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAtMgdeptEmpList", srch);
	}

	
}
