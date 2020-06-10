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
public class WorkTime {

	private int workTimeCode;	// 출결코드
	private String arrive;		// 퇴근시간
	private String leave;		// 출근시간
	private String halfdayOff;	// 반차출근시간
	
}
