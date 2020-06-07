package com.kh.ergate.group.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.group.model.vo.Search;
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
		return sqlSession.selectOne("groupMapper.selectEmpProfile", empId);
	}

	public ArrayList<Employee> selectEmpListSearch(SqlSessionTemplate sqlSession, Search search) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectEmpListSearch", search);
	}
	
	public ArrayList<Employee> selectRequestList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectRequestList");
	}

//	public Employee updateGroupEmp(SqlSessionTemplate sqlSession, String empId) {
//		return sqlSession.selectOne("groupMapper.updateGroupEmp", empId);
//	}
//
//	public Employee groupRequestDetail(SqlSessionTemplate sqlSession, String empId) {
//		return sqlSession.selectOne("groupMapper.groupRequestDetail", empId);
//	}
	
	
	
}
