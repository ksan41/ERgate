package com.kh.ergate.board.model.vo;

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
public class BoardAttachment {
	
	private int attachmentNo;
	private String originName;
	private String changeName;
	private String boardType;
	private int refBoardNo;
}
