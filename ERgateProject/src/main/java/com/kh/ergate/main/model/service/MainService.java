package com.kh.ergate.main.model.service;

import com.kh.ergate.main.model.vo.Employee;

public interface MainService {
	
	// 로그인용 서비스
	Employee loginMember(Employee e);
	
	// 아이디 찾기용 서비스
	Employee findId(Employee e);
	
	// 비밀번호 찾기용 서비스
	Employee findPwd(Employee e);
	
	// 비밀번호 수정용 서비스
	int updatePwd(Employee e);
	
	// 아이디 중복확인용 서비스
	int idCheck(String empId);
	
	// 계정등록용 서비스
	int insertRequest(Employee e);
	
	// 계정승인용 서비스
	int approvalMember(Employee e);
	
	// 회원정보 수정용 서비스
	int updateMember(Employee e);

}
