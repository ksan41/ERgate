package com.kh.ergate.attendance.model.vo;

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
public class UseHoliday {

	private int useHolidayNo;			// 휴가번호
	private String empId;				// 아이디
	private String holidayTypeCode;		// 휴가타입코드
	private String holidayStart;		// 휴가시작일시
	private String holidayEnd;			// 휴가종료일시
	private String holidayUsecount;		// 휴가사용일수
	
}
