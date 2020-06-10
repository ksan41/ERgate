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
public class SignAttachment {
	private int fileNo; //파일번호
	private long refDocNo; //문서번호
	private String filePath; //파일경로
	private String originName; //파일원본명
	private String changeName; //파읿수정명
	
}
