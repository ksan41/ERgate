package com.kh.ergate.sign.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.sign.model.service.SignServiceImpl;
import com.kh.ergate.sign.model.vo.SignDocument;

public class SignController {
	
	private SignServiceImpl siSevice;
	
	@RequestMapping("waitingList.si")
	public String selectWaitingList(SignDocument sd,Model model) {
		return "sign/signWaitingList";
	}

}
