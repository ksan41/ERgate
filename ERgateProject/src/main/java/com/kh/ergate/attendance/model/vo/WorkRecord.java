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

	private int workRecordNo;
	private String empId;
	private String clockIn;
	private String clockOut;
	private String workDate;
}
