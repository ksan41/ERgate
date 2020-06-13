package com.kh.ergate.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.vo.Email;
import com.kh.ergate.mail.model.vo.MailAttachment;

@Repository("milDao")
public class MailDao {

	// 받은 메일
	public int selectListCount(SqlSessionTemplate sqlSession, String mailTo) {
		return sqlSession.selectOne("mailMapper.selectListCount", mailTo);
	}
	public ArrayList<Email> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailTo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", mailTo, rowBounds);
	}
	
	
	// 보낸 메일
	public int fselectListCount(SqlSessionTemplate sqlSession, String mailFrom) {
		return sqlSession.selectOne("mailMapper.fselectListCount", mailFrom);
	}
	public ArrayList<Email> fselectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailFrom) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.fselectList", mailFrom, rowBounds);
	}

	
	// 중요메일
	public int iselectListCount(SqlSessionTemplate sqlSession, String mailOwn) {
		return sqlSession.selectOne("mailMapper.iselectListCount", mailOwn);
	}
	public ArrayList<Email> iselectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailOwn) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.iselectList", mailOwn, rowBounds);
	}
	
	
	
	
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("mailMapper.searchListCount", sc);
	}
	public ArrayList<Email> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.searchList", sc, rowBounds);
	}
	public int isearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("mailMapper.isearchListCount", sc);
	}
	public ArrayList<Email> isearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.isearchList", sc, rowBounds);
	}
	
	
	
	
	

	public int readFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("mailMapper.readFlagUpdate", mailNo);
	}

	public Email selectMail(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.selectOne("mailMapper.selectMail", mailNo);
	}

	public ArrayList<MailAttachment> fileList(SqlSessionTemplate sqlSession, int mailNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.fileList", mailNo);
	}





	

}













