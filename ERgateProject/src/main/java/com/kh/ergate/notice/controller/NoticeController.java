package com.kh.ergate.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.notice.model.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	private NoticeServiceImpl noService;
	
	// 공지사항 리스트조회용
	@RequestMapping("list.no")
	public String selectNoticeList() {
		return "notice/noticeList";
	}
}
