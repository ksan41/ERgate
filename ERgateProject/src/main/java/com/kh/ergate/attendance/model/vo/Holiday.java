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
public class Holiday {

	private int holidayNo;
	private String empId;
	private int hday;
	private int useday;
	private int remainDay;
	private String year;
}
