package com.kh.ergate.schedule.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ScheduleCallpeople {
	private int scheduleNo;
	private String empId;
	private String callPeople; //수신자
	private String deptName;
	
}
