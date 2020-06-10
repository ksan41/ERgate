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
		return sqlSession.selectOne("selectEmpHoliday", holiday);
	}

	public ArrayList<Employee> selectAtMgListAjax(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectAtMgListAjax");
	}

	public ArrayList<Employee> selectAtMgdeptEmpList(SqlSessionTemplate sqlSession, Search srch) {
		return (ArrayList)sqlSession.selectList("selectAtMgdeptEmpList", srch);
	}

	
}
