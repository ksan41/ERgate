package com.kh.ergate.notice.model.service;

import java.util.ArrayList;

import com.kh.ergate.notice.model.vo.Notice;

public interface NoticeService {
	
	
	//공지사항 리스트조회용
	public ArrayList<Notice> selectNoticeList(int currentPage);
	
	//공지사항 검색용 
	public ArrayList<Notice> searchNoticeList(String condition,String keyword);
	
	//공지사항상세조회용
	public Notice selectNotice(int nno);
	
	//공지사항등록용
	public int insertNotice(Notice n);
	
	//공지사항수정용
	public int updateNotice(Notice n);
	
	//공지사항삭제용
	public int deleteNotice(int nno);

}
