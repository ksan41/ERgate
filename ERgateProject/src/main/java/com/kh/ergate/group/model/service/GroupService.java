package com.kh.ergate.group.model.service;

import com.kh.ergate.main.model.vo.Employee;

public interface GroupService {
	
	// 조직도리스트 요청용 
	void selectGroupList();
	
//	// 사원 검색 요청용
//	Employee searchGroupList(String condition,String keyword);
//	
//	// 승인대기리스트 조회요청용
//	int selectRequestList();
//	
//	// 승인대기 상세 요청용
//	int selectDetail(String empId);
//	
//	// 계정승인용
//	int updateEmployee(Employee e);
//	
//	// 계정승인거절용
//	int noUpdateEmployee(Employee e);

	
}
