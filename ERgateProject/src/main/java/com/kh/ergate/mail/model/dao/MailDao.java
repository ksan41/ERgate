package com.kh.ergate.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.mail.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.mail.model.vo.Email;

@Repository("milDao")
public class MailDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String mailTo) {
		return sqlSession.selectOne("mailMapper.selectListCount", mailTo);
	}

	public ArrayList<Email> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailTo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", mailTo, rowBounds);
	}
	
	public int fselectListCount(SqlSessionTemplate sqlSession, String mailFrom) {
		return sqlSession.selectOne("mailMapper.fselectListCount", mailFrom);
	}

	public ArrayList<Email> fselectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailFrom) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.fselectList", mailFrom, rowBounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("mailMapper.searchListCount", sc);
	}

	public ArrayList<Email> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.searchList", sc, rowBounds);
	}


	

}













