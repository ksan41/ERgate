package com.kh.ergate.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {

	@RequestMapping("list.bo")
	public String tempPage() {
		return "board/boardList";
	}
	
}
