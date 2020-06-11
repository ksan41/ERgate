package com.kh.ergate.schedule.model.vo;

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
public class ScheduleJoinpeople {
	private int scheduleNo;
	private String empId;
	private String joinPeople; //참석자
	private String deptName;

}
