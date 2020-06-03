package com.kh.ergate.main.model.vo;

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
public class Employee {
	
	private String empId;
	private String rankCode;
	private String deptCode;
	private String jobCode;
	private String empCode;
	private String empPwd;
	private String empName;
	private Date hireDate;
	private String empExtension;
	private String empFax;
	private String EmpComEmail;
	private String empPriEmail;
	private String empPhone;
	private String empAddress;
	private String empAddressDetail;
	private String empImage;
	private String empBirthday;
	private String resignFlag;
	private Date resignDate;
	private int empStatus;
	
	private String rankTitle;
	private String deptTitle;
	private String jobTitle;

}
