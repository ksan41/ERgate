package com.kh.ergate.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.notice.model.dao.NoticeDao;
import com.kh.ergate.notice.model.vo.Notice;

@Service("noService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noDao;
	
	// 공지사항 게시글 수 조회용
	@Override
	public int selectListCount() {
		return noDao.selectListCount(sqlSession);
	}

	// 공지사항 리스트조회용
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return noDao.selectNoticeList(sqlSession,pi);
	}
	
	// 공지사항 검색시 게시글 수 조회용
	@Override
	public int searchListCount(SearchCondition sc) {
		return noDao.searchListCount(sqlSession,sc);
	}
	
	// 공지사항 검색 시 게시글 리스트 조회용
	@Override
	public ArrayList<Notice> searchNoticeList(SearchCondition sc, PageInfo pi) {
		return noDao.searchNoticeList(sqlSession,pi,sc);
	}
	
	
	// 공지사항 게시글 증가용
	@Override
	public int increaseCount(int nno) {
		return noDao.increaseCount(sqlSession,nno);
	}
	
	// 공지사항 상세조회용
	@Override
	public Notice selectNotice(int nno) {
		return noDao.selectNotice(sqlSession,nno);
	}
	
	// 공지사항 이전글/다음글 조회용
	@Override
	public Notice beforeB(int refBoardNo) {
		return noDao.beforeB(sqlSession,refBoardNo);
	}

	@Override
	public Notice afterB(int refBoardNo) {
		return noDao.afterB(sqlSession,refBoardNo);
	}
	
	
	// 공지사항 상세- 파일 조회용
	@Override
	public ArrayList<BoardAttachment> fileList(int refBoardNo) {
		return noDao.fileList(sqlSession, refBoardNo);
	}

	@Override
	public Notice beforeN(int refBoardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice afterN(int refBoardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNoticeAttachment(BoardAttachment bt) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNoticeFlag() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardAttachment fileOne(int fno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int fileDbDelete(int parseInt) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	

}
