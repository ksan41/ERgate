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
public class SearchCondition {
	
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	
}
