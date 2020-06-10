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
public class HolidayType {
	private String holidayTypecode;	// 휴가타입코드
	private String holidayType;		// 휴가타입
	private String holidayCount;	// 휴가타입 별 휴가일수
}
