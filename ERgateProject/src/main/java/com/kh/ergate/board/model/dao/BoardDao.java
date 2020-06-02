package com.kh.ergate.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;

@Repository("bodDao")
public class BoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
		
	}

	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("boardMapper.searchListCount", sc);
	}

	public ArrayList<Board> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", sc, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) { 
		return sqlSession.update("boardMapper.increaseCount", bno); 
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) { 
		return sqlSession.selectOne("boardMapper.selectBoard", bno); 
	}

	public ArrayList<BoardAttachment> fileList(SqlSessionTemplate sqlSession, int refBoardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.fileList", refBoardNo);
	}
	
	
	
	
	
	/*
	 * public int insertBoard(SqlSessionTemplate sqlSession, Board b) { return
	 * sqlSession.insert("boardMapper.insertBoard", b); }
	 * 

	 * 
	 * public int deleteBoard(SqlSessionTemplate sqlSession, int bno) { return
	 * sqlSession.update("boardMapper.deleteBoard", bno); }
	 * 
	 * public int updateBoard(SqlSessionTemplate sqlSession, Board b) { return
	 * sqlSession.update("boardMapper.updateBoard", b); }
	 */

}













