package com.kh.ergate.sign.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignDocument {
	private int documentNo;
	private String signTypeNo;
	private String empId;
	private String signTypeName;
	private String empName;
	private String deptTitle;
	private String signTitle;
	private String signContent;
	private Date draftDate;
	private int docStatus;
	private String status;
	private Date expenseStartDate;
	private Date expenseEndDate;
	private int signStep;
	private int signStatus;
	private String holidayType;
	private String holidayStart;
	private String holidayEnd;
	private String holidayUsecount;
	
}
