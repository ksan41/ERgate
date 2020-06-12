package com.kh.ergate.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.common.model.vo.PageInfo;

@Repository("milDao")
public class MailDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", null, rowBounds);
	}
	

}













