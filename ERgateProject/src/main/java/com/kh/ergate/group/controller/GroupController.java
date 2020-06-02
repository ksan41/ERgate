package com.kh.ergate.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.group.model.service.GroupService;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService grService;
	
	@RequestMapping("groupList.gr")
	public String selectGroupList(Model model) {
		return "group/groupList";
	}

}
