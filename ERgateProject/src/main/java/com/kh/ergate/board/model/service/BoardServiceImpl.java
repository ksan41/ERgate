package com.kh.ergate.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.board.model.dao.BoardDao;
import com.kh.ergate.board.model.vo.Board;
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
	public int insertBoard(com.kh.ergate.board.model.vo.Board b) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int increaseCount(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public com.kh.ergate.board.model.vo.Board selectBoard(int bno) {
		// TODO Auto-generated method stub
		return null;
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





