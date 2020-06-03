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
public class ReReply {
	private int replyNo;
	private String empId;
	private int refRno;
	private String replyContent;
	private Date replyEnrollDate;
	private String replyWriter;
	private int refBno;
}
