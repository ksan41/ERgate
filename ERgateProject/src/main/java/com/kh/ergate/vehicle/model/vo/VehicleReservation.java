package com.kh.ergate.vehicle.model.vo;

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
public class VehicleReservation {
	
	private int vhclReservNo;
	private String empId;
	private String vhclCode;
	private Date vhclReservDate;
	private String deptTitle;
	private String vhclStartDate;
	private String vhclStartTime;
	private String vhclEndDate;
	private String vhclEndTime;
	private String vhclPurpose;
	private String vhclStatus;

}
