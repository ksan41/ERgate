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

	public Employee selectEmpProfile(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("groupMapper.selectEmpProfile", empId);
	}
	
	
}
