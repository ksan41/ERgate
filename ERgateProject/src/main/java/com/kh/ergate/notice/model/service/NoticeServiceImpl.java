package com.kh.ergate.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.notice.model.dao.NoticeDao;
import com.kh.ergate.notice.model.vo.Notice;

@Service("noService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noDao;
	
	@Override
	public ArrayList<Notice> selectNoticeList(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Notice> searchNoticeList(String condition, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice selectNotice(int nno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
