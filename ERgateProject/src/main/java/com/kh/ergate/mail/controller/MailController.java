package com.kh.ergate.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.mail.model.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService milService;

	@RequestMapping("list.mil")
	public String selectList(int currentPage, Model model) {

		int listCount = milService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Board> list = milService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "mail/mailInbox";
	}
	

}
