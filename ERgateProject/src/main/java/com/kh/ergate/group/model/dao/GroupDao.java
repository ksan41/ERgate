package com.kh.ergate.group.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.main.model.vo.Employee;

@Repository("grDao")
public class GroupDao {

	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectEmpList");
	}

	public ArrayList<Employee> selectDeptEmpList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectDeptEmpList", keyword);
	}
	
	public Employee selectEmpProfile(SqlSessionTemplate sqlSession, String empId) {
		System.out.println(empId);
		return sqlSession.selectOne("groupMapper.selectEmpProfile", empId);
	}
	
	
	
	
}
