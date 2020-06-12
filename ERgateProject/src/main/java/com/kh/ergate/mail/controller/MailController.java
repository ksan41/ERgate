package com.kh.ergate.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.mail.model.service.MailService;
import com.kh.ergate.mail.model.vo.Email;

@Controller
public class MailController {

	@Autowired
	private MailService milService;

	@RequestMapping("list.mil")
	public String selectList(int currentPage, Model model) {

		int listCount = milService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Email> list = milService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "mail/mailInbox";
	}
	
	@RequestMapping("search.mil")
	public String searchEmailList(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition();
		
		switch(condition) {
		case "mailTitle" : sc.setMailTitle(keyword);  break;
		case "mailContent" : sc.setMailContent(keyword); break;
		case "mailnameFrom" : sc.setMailnameFrom(keyword); break;
		}
		
		
		
		int searchListCount = milService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Email> slist = milService.searchList(pi,sc);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);	// 검색된 값인지 일반 게시글 리스트인지 구별하기 위한 값 반환 (sc가 1이면 검색결과, sc라는 키값이 없으면 일반 글목록)
		return "mail/mailInbox";
	}
}
