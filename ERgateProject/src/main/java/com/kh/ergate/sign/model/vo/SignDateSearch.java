package com.kh.ergate.sign.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class SignDateSearch {
	private int condition; // 0 : 결재상신내역 / 1: 지출결의내역
	private String year;
	private String month;
	private String day;
	private String empId;
}
