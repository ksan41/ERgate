package com.kh.ergate.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.board.model.dao.BoardDao;
import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.ReReply;
import com.kh.ergate.board.model.vo.Reply;
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
		return bodDao.selectBoard(sqlSession, bno);
	}
	
	@Override
	public ArrayList<BoardAttachment> fileList(int refBoardNo) {
		return bodDao.fileList(sqlSession, refBoardNo);
	}
	
	@Override
	public ArrayList<Reply> replyList(int refBno) {
		return bodDao.replyList(sqlSession, refBno);
	}

	@Override
	public ArrayList<ReReply> rereplyList(int refRno) {
		return bodDao.rereplyList(sqlSession, refRno);
	}
	
	@Override
	public Board beforeB(int refBoardNo) {
		return bodDao.beforeB(sqlSession, refBoardNo);
	}
	@Override
	public Board afterB(int refBoardNo) {
		return bodDao.afterB(sqlSession, refBoardNo);
	}
	
	@Override
	public int insertBoard(Board b) {
		return bodDao.insertBoard(sqlSession, b);
	}
	
	@Override
	public int insertBoardAttachment(BoardAttachment bt) {
		return bodDao.insertBoardAttachment(sqlSession, bt);
	}
	
	@Override
	public int updateBoardFlag() {
		return bodDao.updateBoardFlag(sqlSession);
	}
	
	@Override
	public int insertReReply(ReReply replForm) {
		return bodDao.ReReply(sqlSession, replForm);
	}
	@Override
	public ReReply rereplyOne(int refRno) {
		return bodDao.ReReplyOne(sqlSession, refRno);
	}
	@Override
	public int insertReply(Reply repl) {
		return bodDao.insertReply(sqlSession, repl);
	}

	@Override
	public int updateReply(Reply repl) {
		return bodDao.updateReply(sqlSession, repl);
	}
	@Override
	public int updateReReply(ReReply repl) {
		return bodDao.updateReReply(sqlSession, repl);
	}
	
	@Override
	public int deleteReply(int replyNo) {
		return bodDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int deleteReReply(int replyNo) {
		return bodDao.deleteReReply(sqlSession, replyNo);
	}
	
	@Override
	public int checkHaveReply(int replyNo) {
		return bodDao.checkHaveReply(sqlSession, replyNo);
	}
	
	@Override
	public int replyForceDelete(int replyNo) {
		return bodDao.replyForceDelete(sqlSession, replyNo);
	}
	
	@Override
	public int deleteBoard(int bno) {
		return bodDao.deleteBoard(sqlSession, bno);
	}
	
	
	@Override
	public int updateBoard(Board b) {
		return bodDao.updateBoard(sqlSession, b);
	}

	@Override
	public BoardAttachment fileOne(int fno) {
		return bodDao.fileOne(sqlSession, fno);
	}

	@Override
	public int fileDbDelete(int nowFno) {
		return bodDao.fileDbDelete(sqlSession, nowFno);
	}

	

	




	

	

	

	

	

	

	

	

	

	
	
	

}





