package com.kh.ergate.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.dao.MailDao;

@Service("milService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MailDao milDao;

	@Override
	public int selectListCount() {
		return milDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return milDao.selectList(sqlSession, pi);
	}
	
	
	
	

	

	

	

	
	
	

}





