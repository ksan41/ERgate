package com.kh.ergate.mail.model.service;

import java.util.ArrayList;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.vo.Email;
import com.kh.ergate.mail.model.vo.MailAttachment;

public interface MailService {
	// 받은메일
	int selectListCount(String mailTo);
	ArrayList<Email> selectList(PageInfo pi, String mailTo);
	// 보낸메일
	int fselectListCount(String mailFrom);
	ArrayList<Email> fselectList(PageInfo pi, String mailFrom);
	// 중요메일
	int iselectListCount(String mailOwn);
	ArrayList<Email> iselectList(PageInfo pi, String mailOwn);
	
	
	// 받은메일+보낸메일 검색
	int searchListCount(SearchCondition sc);
	ArrayList<Email> searchList(PageInfo pi, SearchCondition sc);
	// 중요메일 검색
	int isearchListCount(SearchCondition sc);
	ArrayList<Email> isearchList(PageInfo pi, SearchCondition sc);
	
	
	int readFlagUpdate(int mailNo);
	Email selectMail(int mailNo);
	ArrayList<MailAttachment> fileList(int mailNo);
	
	//메일작성
	int insertMail(Email insertE);
	int insertMailAttachment(MailAttachment mt);
	int updateMailFlag(int currNo);
	Email nowMailNo();
	String loadMailnameTo(String toname);
	int deleteMail(int i);
	int importFlagUpdate(int mailNo);
	int unImportFlagUpdate(int mailNo);
	
	
	
	int notReadMail(String mailOwn);
	int fromMail(String mailOwn);
	int importMail(String mailOwn);
	

	
	
	
	
	
	

}








