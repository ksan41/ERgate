package com.kh.ergate.board.model.vo;

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
public class Board {
	private int boardNo;			//글번호
	private String empId;			//사원아이디
	private String boardWriter;		//사원이름(영어이름)
	private String boardTitle;		//글제목
	private String boardContent;	//글내용
	private Date boardEnrollDate;	//작성일
	private Date boardModifyDate;	//수정일
	private int boardCount;			//글조회수
	private String boardStatus;		//글상태
}




