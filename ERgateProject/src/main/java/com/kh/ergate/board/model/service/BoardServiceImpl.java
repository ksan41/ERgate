package com.kh.ergate.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.board.model.dao.BoardDao;
import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;

@Service("bodService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bodDao;
	
	
	@Override
	public int selectListCount() {
		return bodDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bodDao.selectList(sqlSession, pi);
	}
	
	@Override
	public int searchListCount(SearchCondition sc) {
		return bodDao.searchListCount(sqlSession, sc);
	}
	
	@Override
	public ArrayList<Board> searchList(PageInfo pi, SearchCondition sc) {
		return bodDao.searchList(sqlSession,  pi, sc);
	}

	@Override
	public int increaseCount(int bno) {
		return bodDao.increaseCount(sqlSession, bno);
	}
	@Override
	public Board selectBoard(int bno) {
		return bodDao.selectboard(sqlSession, bno);
	}
	
	
	
	
	@Override
	public int insertBoard(com.kh.ergate.board.model.vo.Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateBoard(com.kh.ergate.board.model.vo.Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

}





