package com.kh.ergate.mail.model.service;

import java.util.ArrayList;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.vo.Email;

public interface MailService {

	int selectListCount();
	ArrayList<Email> selectList(PageInfo pi);
	int searchListCount(SearchCondition sc);
	ArrayList<Email> searchList(PageInfo pi, SearchCondition sc);
	
	
	
	
	

}








