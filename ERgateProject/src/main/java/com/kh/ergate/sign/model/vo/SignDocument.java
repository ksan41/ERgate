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
	private int documentNo; //문서번호
	private String signTypeNo; //결재양식번호
	private String empId; //기안자아이디
	private String signTypeName; //결재양식명
	private String empName; //기안자이름
	private String deptTitle; //기안자부서명
	private String signTitle; //제목
	private String signContent; //내용
	private Date draftDate; //기안일
	private int docStatus; //문서상태 (0: 임시저장, 1: 대기중, 2: 상신)
	private String status; //삭제여부 ('Y','N')
	private Date expenseStartDate; //지출시작일(지출결의서)
	private Date expenseEndDate; //지출종료일(지출결의서)
	private int signStep; //결재단계
	private int signStatus; // 결재상태 (0: 진행중, 1:결재완료, 2: 미결)
	private String holidayType;  //휴가타입(휴가계/연차,오전반차,오후반차,경조사,공가,병가,휴직)
	private String holidayStart; //휴가시작일시(휴가계)
	private String holidayEnd; //휴가종료일시(휴가계)
	private String holidayUsecount; //휴가사용일수(휴가계)
	
}
