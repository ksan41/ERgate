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
	

	// 결재 상세 요청용
	@Override
	public SignDocument signDetail(SignDocument sdd) {
		return siDao.signDetail(sqlSession,sdd);
	}
	
	
	//결재상세-첨부파일 리스트 요청용
	@Override
	public ArrayList<SignAttachment> signDetailAttachment(SignDocument sdd) {
		return siDao.signDetailAttachment(sqlSession,sdd);
	}
	
	//결재상세-결재자 정보 요청용
	@Override
	public ArrayList<Signer> signDetailSigner(SignDocument sdd) {
		return siDao.signDetailSigner(sqlSession,sdd);
	}
	

	// 상신내역 게시글수 조회용
	@Override
	public int selectRlistCount(SignDateSearch sds) {
		return siDao.selectRlistCount(sqlSession,sds);
	}
	
	// 상신내역 요청용
	@Override
	public ArrayList<SignDocument> reportList(PageInfo pi,SignDateSearch sds) {
		return siDao.reportList(sqlSession,sds,pi);
	}
	
	// 지출결의내역 리스트 요청
	@Override
	public ArrayList<SignDocument> expenseList(PageInfo pi) {
		return siDao.expenseList(sqlSession,pi);
	}
	
	// 지출결의내역 게시글 수 조회용
	@Override
	public int selectElistCount() {
		return siDao.selectElistCount(sqlSession);
	}
	
	// 월별 게시글 수 조회용(공용)
	@Override
	public int searchListCount(SignDateSearch sds) {
		return siDao.searchListCount(sqlSession,sds);
	}
	
	// 월별 게시글 조회용
	@Override
	public ArrayList<SignDocument> searchList(PageInfo pi, SignDateSearch sds) {
		return siDao.searchList(sqlSession,pi,sds);
	}
	
	
	// 결재자 등록요청용
	@Override
	public int insertSigner(Signer si) {
		return siDao.insertSigner(sqlSession,si);
	}

	
	// 결재문서 등록용
	@Override
	public int insertDocument(SignDocument sd) {
		return siDao.insertDocument(sqlSession,sd);
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
	
	// 진행결재함 게시글 수 조회용
	@Override
	public int selectOlistCount(String empId) {
		return siDao.selectOlistCount(sqlSession,empId);
	}
	
	// 진행결재함 리스트 요청용
	@Override
	public ArrayList<SignDocument> ongoingList(PageInfo pi, String empId) {
		return siDao.ongoingList(sqlSession,pi,empId);
	}
	
	// 결재대기함 게시글 수 조회용
	@Override
	public int selectWlistCount(String empId) {
		return siDao.selectWlistCount(sqlSession,empId);
	}
	
	// 결재대기함 리스트 요청용
	@Override
	public ArrayList<SignDocument> selectWaitingList(PageInfo pi,String empId) {
		return siDao.selectWaitingList(sqlSession,pi,empId);
	}

	
	// 결재처리용
	@Override
	public int updateSign(Signer si) {
		return siDao.updateSign(sqlSession,si);
	}


	@Override
	public int updateSignDoc(Signer si) {
		return siDao.updateSignDoc(sqlSession,si);
	}



}
