package com.kh.ergate.attendance.model.service;

import java.util.ArrayList;

import com.kh.ergate.attendance.model.vo.Holiday;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

public interface AttendanceService {

	// 사원별 근태현황 상세 조회용
	ArrayList<Holiday> selectAtMgDetail(Holiday holiday);

	//	사원 휴가 조회
	Holiday selectEmpHoliday(Holiday holiday);

	// 근태관리 리스트 조회용
	ArrayList<Employee> selectAtMgListAjax();

	// 근태관리 부서별 사원 조회 - 가운데 부분 ajax
	ArrayList<Employee> selectAtMgdeptEmpList(Search srch);

}
