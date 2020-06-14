package com.kh.ergate.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.dao.MailDao;
import com.kh.ergate.mail.model.vo.Email;
import com.kh.ergate.mail.model.vo.MailAttachment;

@Service("milService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MailDao milDao;

	@Override
	public int selectListCount(String mailTo) {
		return milDao.selectListCount(sqlSession, mailTo);
	}
	@Override
	public ArrayList<Email> selectList(PageInfo pi, String mailTo) {
		return milDao.selectList(sqlSession, pi, mailTo);
	}
	
	@Override
	public int fselectListCount(String mailFrom) {
		return milDao.fselectListCount(sqlSession, mailFrom);
	}
	@Override
	public ArrayList<Email> fselectList(PageInfo pi, String mailFrom) {
		return milDao.fselectList(sqlSession, pi, mailFrom);
	}
	
	@Override
	public int iselectListCount(String mailOwn) {
		return milDao.iselectListCount(sqlSession, mailOwn);
	}
	@Override
	public ArrayList<Email> iselectList(PageInfo pi, String mailOwn) {
		return milDao.iselectList(sqlSession, pi, mailOwn);
	}
	
	
	
	
	
	@Override
	public int searchListCount(SearchCondition sc) {
		return milDao.searchListCount(sqlSession, sc);
	}
	@Override
	public ArrayList<Email> searchList(PageInfo pi, SearchCondition sc) {
		return milDao.searchList(sqlSession,  pi, sc);
	}
	@Override
	public int isearchListCount(SearchCondition sc) {
		return milDao.isearchListCount(sqlSession, sc);
	}
	@Override
	public ArrayList<Email> isearchList(PageInfo pi, SearchCondition sc) {
		return milDao.isearchList(sqlSession,  pi, sc);
	}
	
	
	
	
	
	@Override
	public int readFlagUpdate(int mailNo) {
		return milDao.readFlagUpdate(sqlSession, mailNo);
	}

	@Override
	public Email selectMail(int mailNo) {
		return milDao.selectMail(sqlSession, mailNo);
	}

	@Override
	public ArrayList<MailAttachment> fileList(int mailNo) {
		return milDao.fileList(sqlSession, mailNo);
	}
	
	
	
	//메일작성
	@Override
	public int insertMail(Email insertE) {
		return milDao.insertMail(sqlSession, insertE);
	}
	@Override
	public int insertMailAttachment(MailAttachment mt) {
		return milDao.insertMailAttachment(sqlSession, mt);
	}
	@Override
	public int updateMailFlag(int currNo) {
		return milDao.updateMailFlag(sqlSession, currNo);
	}
	@Override
	public Email nowMailNo() {
		return milDao.nowMailNo(sqlSession);
	}




	
	
	
	
	

	

	

	

	
	
	

}





