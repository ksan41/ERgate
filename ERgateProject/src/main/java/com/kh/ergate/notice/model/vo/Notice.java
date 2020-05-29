package com.kh.ergate.notice.model.vo;

import java.sql.Date;

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
public class Notice {
	private int noticeNo; //공지사항번호
	private String empId; // 작성자 아이디
	private String noticeWriter; //작성자명
	private String noticeTitle; //제목
	private String noticeContent; //내용
	private Date noticeEnrollDate; //작성일
	private Date noticeModifyDate; //수정일
	private int noticeCount; //조회수
	private String noticeStatus; //노출여부
}
