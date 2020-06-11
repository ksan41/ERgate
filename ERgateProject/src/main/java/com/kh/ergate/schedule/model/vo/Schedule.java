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
public class Schedule {
	private int scheduleNo;
	private String empId;
	private String scheduleTitle;
	private String scheduleContent;
	private String scheduleStartDay;
	private String scheduleEndDay;
	private String scheduleStartTime;
	private String scheduleEndTime;
	private String scheduleKind;
	private String outMeetingRoom;
	private String inMeetingRoom;
	private String callPeople;
	private String joinPeople;
}
