package com.kh.ergate.mail.model.service;

import java.util.ArrayList;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.common.model.vo.PageInfo;

public interface MailService {

	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	
	
	
	

}








