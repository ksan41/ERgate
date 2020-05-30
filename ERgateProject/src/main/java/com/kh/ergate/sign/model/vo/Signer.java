package com.kh.ergate.sign.model.vo;

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
public class Signer {
	private int documentNo; //참조문서번호
	private String empId; //결재자 아이디
	private String empName; //결재자 이름
	private int signTurn; //결재순서
	private int signType; //결재종류
	private String signed; //결재여부 (기본'N')
}
