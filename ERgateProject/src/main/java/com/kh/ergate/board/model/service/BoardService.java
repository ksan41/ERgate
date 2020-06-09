package com.kh.ergate.board.model.service;

import java.util.ArrayList;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.ReReply;
import com.kh.ergate.board.model.vo.Reply;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;

public interface BoardService {
	
	// 1. 게시판 리스트 조회용 서비스
	// 1_1. 게시판 총갯수 조회용 서비스
	int selectListCount();
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시판 검색 리스트 조회용 서비스
	// 2-1. 검색된 게시판 총갯수 조회용서비스
	int searchListCount(SearchCondition sc);
	// 2-2. 요청한 페이지에 보여질 검색된 게시글 리스트 조회용 서비스
	ArrayList<Board> searchList(PageInfo pi, SearchCondition sc);
	
	// 3. 게시판 상세조회용 서비스
	// 3_1. 해당 게시글 조회수 증가용 서비스
	int increaseCount(int bno);
	// 3_2. 해당 게시글 조회용 서비스
	Board selectBoard(int bno);
	// 3_3. 해당 게시글 파일 조회용 서비스
	ArrayList<BoardAttachment> fileList(int refBoardNo);
	// 3-4. 해당 게시글 리플 조회용 서비스
	ArrayList<Reply> replyList(int refBno);
	// 3-5. 해당 게시글 대댓글 조회용 서비스
	ArrayList<ReReply> rereplyList(int refRno);
	// 3-6. 해당 게시글 다음글 / 이전글 조회용 서비스
	Board beforeB(int refBoardNo);
	Board afterB(int refBoardNo);
	
	// 4. 게시판 작성용서비스
	int insertBoard(Board b);
	// 4-1. 게시판 첨부파일 서비스
	int insertBoardAttachment(BoardAttachment bt);
	// 4-2. 게시판 첨부파일 없는 게시글 flag 수정용 서비스
	int updateBoardFlag();
	
	
	// 5. 게시판 댓글/대댓글 작성/수정/삭제용 서비스
	int insertReReply(ReReply replForm);
	ReReply rereplyOne(int refRno);
	int insertReply(Reply repl);
	int updateReply(Reply repl);
	int updateReReply(ReReply repl);
	int deleteReply(int replyNo);
	int deleteReReply(int replyNo);
	int checkHaveReply(int replyNo);// 관련된 대댓글 있는지 확인하는 메소드
	int replyForceDelete(int replyNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int bno);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	

	
	
	
	

}








