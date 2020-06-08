package com.kh.ergate.group.model.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

public interface GroupService {
	
	// 조직도 리스트 요청용 (가운데 부분) 
	ArrayList<Employee> selectEmpList();
	
	// 조직도 리스트 사원 프로필 요청용 (오른쪽 영역)
	Employee selectEmpProfile(String empId);

	// 조직도 부서별 사원 조회
	ArrayList<Employee> selectDeptEmpList(String keyword);

	// 조직도 키워드 검색 
	ArrayList<Employee> selectEmpListSearch(Search search);
	
	// 승인대기리스트 조회요청용
	ArrayList<Employee> selectRequestList();

	// 사원 계정 수정 요청 
	int updateGroupEmp(Employee emp);

	// 승인대기 사원 프로필 상세 요청용
	Employee selectGroupRequestDetail(String empId);

	// 계정승인 거절용
	int noUpdateGroupEmp(String empId);

	// 사원 계정 수정용
	//Employee updateGroupEmp(String empId);
	
	
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
