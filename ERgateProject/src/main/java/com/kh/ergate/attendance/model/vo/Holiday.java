package com.kh.ergate.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Holiday {

	private int holidayNo;				// 휴가일수코드
	private String empId;				// 아이디	
	private int hday;					// 총 휴가일수(생성연차)
	private int useday;					// 사용일수(총 휴가중 사용한 일수)
	private int remainDay;				// 잔여일수(총 휴가중 남은 일수)
	private String year;				// 년도
	 
	// UseHoliday VO
	private int useHolidayNo;			// 휴가번호
	private String holidayTypeCode;		// 휴가타입코드
	private String holidayStart;		// 휴가시작일시
	private String holidayEnd;			// 휴가종료일시
	private String holidayUsecount;		// 휴가사용일수
	
	// HolidayType VO
	private String holidayType;			// 휴가타입
	private String holidayCount;		// 휴가타입 별 휴가일수
	
	private String empName;				// 사원이름
	private String rankTitle;			// 부서
	private String deptTitle;			// 직급
	private String jobTitle;			// 직책
	private Date hireDate;				// 입사일
}
