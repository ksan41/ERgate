package com.kh.ergate.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.notice.model.vo.Notice;

@Repository("noDao")
public class NoticeDao {
	
	// 공지사항 게시글 수 조회용
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	// 공지사항 리스트 조회용
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList",null,rowBounds);
	}
	
	// 공지사항 검색 시 게시글 수 조회용
	public int searchListCount(SqlSessionTemplate sqlSession,SearchCondition sc) {
		return sqlSession.selectOne("noticeMapper.searchListCount",sc);
	}
	
	// 공지사항 검색 시 게시글 리스트 조회용
	public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNoticeList",sc,rowBounds);
	}
	
	// 공지사항 조회수 증가용
	public int increaseCount(SqlSessionTemplate sqlSession,int nno) {
		return sqlSession.update("noticeMapper.increaseCount",nno);
	}
	
	// 공지사항 상세조회용
	public Notice selectNotice(SqlSessionTemplate sqlSession,int nno) {
		return sqlSession.selectOne("noticeMapper.selectNotice",nno);
	}
	
	//공지사항 상세조회- 첨부파일 요청용
	public ArrayList<BoardAttachment> fileList(SqlSessionTemplate sqlSession, int refBoardNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.fileList", refBoardNo);
	}
	
	//공지사항 이전글 정보 조회용
	public Notice beforeB(SqlSessionTemplate sqlSession,int refBoardNo) {
		return sqlSession.selectOne("noticeMapper.beforeB",refBoardNo);
	}
	
	//공지사항  다음글 정보 조회용
	public Notice afterB(SqlSessionTemplate sqlSession,int refBoardNo) {
		return sqlSession.selectOne("noticeMapper.afterB",refBoardNo);
	}
	
	//공지사항 작성용
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	//공지사항-파일 첨부용
	public int insertNoticeAttachment(SqlSessionTemplate sqlSession, BoardAttachment bt) {
		return sqlSession.insert("noticeMapper.insertNoticeAttachment", bt);
	}
	
	//공지사항 flag 변경용
	public int updateNoticeFlag(SqlSessionTemplate sqlSession) {
		return sqlSession.update("noticeMapper.updateNoticeFlag");
	}
	
}
