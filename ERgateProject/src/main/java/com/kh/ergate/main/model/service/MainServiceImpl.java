package com.kh.ergate.main.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.main.model.dao.MainDao;
import com.kh.ergate.main.model.vo.Employee;

@Service("mService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainDao mDao;
	

	// 로그인용 서비스
	@Override
	public Employee loginMember(Employee e) {
		return mDao.loginMember(sqlSession, e);
	}

	// 아이디 찾기용 서비스
	@Override
	public Employee findId(Employee e) {
		return mDao.findId(sqlSession, e);
	}

	// 비밀번호 찾기용 서비스
	@Override
	public Employee findPwd(Employee e) {
		return mDao.findPwd(sqlSession, e);
	}

	// 비밀번호 수정용 서비스
	@Override
	public int updatePwd(Employee e) {
		return mDao.updatePwd(sqlSession, e);
	}

	// 아이디 중복확인용 서비스
	@Override
	public int idCheck(String empId) {
		return mDao.idCheck(sqlSession, empId);
	}
	
	// 이름 중복확인용 서비스
	@Override
	public int nameCheck(String empName) {
		return mDao.nameCheck(sqlSession, empName);
	}

	// 계정등록용 서비스
	@Override
	public int insertRequest(Employee e) {
		return mDao.insertRequest(sqlSession, e);
	}

	// 계정승인용 서비스
	@Override
	public int approvalMember(Employee e) {
		return mDao.approvalMember(sqlSession, e);
	}

	// 회원정보 수정용 서비스
	@Override
	public int updateMember(Employee e) {
		return mDao.updateMember(sqlSession, e);
	}

}
