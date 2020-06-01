package com.kh.ergate.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.main.model.vo.Employee;

@Repository("mDao")
public class MainDao {
	
	public Employee loginMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("mainMapper.loginMember", e);
	}
	
	public String findId(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("mainMapper.findId", e);
	}
	
	public Employee findPwd(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("mainMapper.findPwd", e);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, String userPwd) {
		return sqlSession.update("mainMapper.updatePwd", userPwd);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mainMapper.idCheck", userId);
	}
	
	public int insertRequest(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("mainMapper.insertRequest", e);
	}
	
	public int approvalMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("mainMapper.approvalMember", e);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("mainMapper.updateMember", e);
	}

}
