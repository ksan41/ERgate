package com.kh.ergate.notice.model.service;

import java.util.ArrayList;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.notice.model.vo.Notice;

public interface NoticeService {
	
	
	// 공지사항 전체 게시글 수 조회용
	public int selectListCount();
	
	//공지사항 리스트조회용
	public ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	//공지사항 검색 시 게시글 수 조회용
	public int searchListCount(SearchCondition sc);
	
	//공지사항 검색시 리스트 조회용
	public ArrayList<Notice> searchNoticeList(SearchCondition sc,PageInfo pi);
	
	//공지사항상세조회용
	public Notice selectNotice(int nno);
	
	//공지사항 이전글/다음글 요청용
	public Notice beforeB(int refBoardNo);
	public Notice afterB(int refBoardNo);
	
	//공지사항 조회수 증가용
	public int increaseCount(int nno);
	
	//공지사항 파일 조회용 서비스
	public ArrayList<BoardAttachment> fileList(int refBoardNo);
	
	//공지사항 다음글 / 이전글 조회용 서비스
	public Notice beforeN(int refBoardNo);
	public Notice afterN(int refBoardNo);
	
	//공지사항등록용
	public int insertNotice(Notice n);
	
	// 공지사항 첨부파일 서비스
	public int insertNoticeAttachment(BoardAttachment bt);
	
	// 공지사항 첨부파일 없는 게시글 flag 수정용 서비스
	public int updateNoticeFlag();
	
	//공지사항수정용
	public int updateNotice(Notice n);
	BoardAttachment fileOne(int fno);
	int fileDbDelete(int parseInt);
	
	
	//공지사항삭제용
	public int deleteNotice(int nno);

}
