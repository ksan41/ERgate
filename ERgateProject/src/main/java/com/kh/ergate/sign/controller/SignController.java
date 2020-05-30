package com.kh.ergate.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.sign.model.service.SignServiceImpl;
import com.kh.ergate.sign.model.vo.SignDocument;

@Controller
public class SignController {
	
	@Autowired
	private SignServiceImpl siSevice;
	
	@RequestMapping("waitingList.si")
	public String selectWaitingList(SignDocument sd,Model model) {
		return "sign/signWaitingList";
	}

}
