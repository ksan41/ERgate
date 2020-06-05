package com.kh.ergate.vehicle.model.vo;

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
public class Vehicle {
	
	private String vhclCode;
	private String vhclModel;
	private String vhclNo;
	private int vhclCapacity;
	private String vhclImage;

}
