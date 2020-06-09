package com.kh.ergate.board.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
public class Reply {
	private int replyNo;
	private String empId;
	private int refBno;
	private String replyContent;
	private Timestamp replyEnrollDate;
	private String replyWriter;
}
