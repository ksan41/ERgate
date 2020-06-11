package com.kh.ergate.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.dao.SignDao;
import com.kh.ergate.sign.model.vo.SignAttachment;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

@Service("siService")
public class SignServiceImpl implements SignService{
	
	@Autowired
	private SignDao siDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<SignDocument> selectWaitingList(SignDocument sd) {
		return null;
	}

	@Override
	public SignDocument signDetail(SignDocument sdd) {
		return siDao.signDetail(sqlSession,sdd);
	}
	
	
	/*
	 * 결재상세-첨부파일 리스트 요청용
	 */
	@Override
	public ArrayList<SignAttachment> signDetailAttachment(SignDocument sdd) {
		return siDao.signDetailAttachment(sqlSession,sdd);
	}
	
	@Override
	public ArrayList<Signer> signDetailSigner(SignDocument sdd) {
		return siDao.signDetailSigner(sqlSession,sdd);
	}
	
	@Override
	public ArrayList<SignDocument> ongoingList(String month, SignDocument sd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SignDocument> reportList(SignDocument sd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 지출결의내역 리스트 요청
	@Override
	public ArrayList<SignDocument> expenseList(PageInfo pi) {
		return siDao.expenseList(sqlSession,pi);
	}
	
	@Override
	public int selectElistCount() {
		return siDao.selectElistCount(sqlSession);
	}
	
	@Override
	public int searchListCount(SignDateSearch sds) {
		return siDao.searchListCount(sqlSession,sds);
	}
	
	@Override
	public ArrayList<SignDocument> searchList(PageInfo pi, SignDateSearch sds) {
		return siDao.searchList(sqlSession,pi,sds);
	}
	
	@Override
	public ArrayList<SignDocument> hrList(SignDocument sd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSign(Signer si, SignDocument sd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noUpdateSign(Signer si, SignDocument sd) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 결재자 등록요청용
	@Override
	public int insertSigner(Signer si) {
		return siDao.insertSigner(sqlSession,si);
	}

	@Override
	public int saveDocument(SignDocument sd) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// 결재문서 등록용
	@Override
	public int insertDocument(SignDocument sd) {
		return siDao.insertDocument(sqlSession,sd);
	}
	
	// 임시저장문서 불러오는용
	@Override
	public SignDocument selectMyDocument(String empId) {
		return siDao.selectMyDocument(sqlSession,empId);
	}
	
	// 결재문서-첨부파일 등록용
	@Override
	public int insertSignAttachment(SignAttachment st) {
		return siDao.insertSignAttachment(sqlSession,st);
	}
	
	// 사용자 잔여연차 조회용
	@Override
	public int selectRemainHoliday(String empId) {
		return siDao.selectRemainHoliday(sqlSession,empId);
	}






}
