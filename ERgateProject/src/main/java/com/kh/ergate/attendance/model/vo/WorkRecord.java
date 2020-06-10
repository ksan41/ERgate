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
public class WorkRecord {

	private int workRecordNo;	// 출퇴근번호
	private String empId;		// 아이디
	private String clockIn;		// 출근기록
	private String clockOut;	// 퇴근기록
	private String workDate;	// 출근일자
}
