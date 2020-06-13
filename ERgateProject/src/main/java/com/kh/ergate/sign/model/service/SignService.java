package com.kh.ergate.sign.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.vo.SignAttachment;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

public interface SignService {
	
	//결재 대기리스트 게시글 수 요청용
	public int selectWlistCount(String empId);
	
	//결재대기리스트요청용
	public ArrayList<SignDocument> selectWaitingList(PageInfo pi,String empId);
	
	//결재상세 요청용
	public SignDocument signDetail(SignDocument sd);
	
	//결재상세-첨부파일 요청용
	public ArrayList<SignAttachment> signDetailAttachment(SignDocument sdd);
	
	//결재상세-결재자리스트 요청용
	public ArrayList<Signer> signDetailSigner(SignDocument sdd);
	
	//진행결재함 게시글수 조회용
	public int selectOlistCount(String empId);
	
	//진행결재함요청용
	public ArrayList<SignDocument> ongoingList(PageInfo pi,String empId);
	
	// 상신내역 게시글수 조회용
	public int selectRlistCount(SignDateSearch sds);
	
	//상신내역요청용 
	public ArrayList<SignDocument> reportList(PageInfo pi,SignDateSearch sds);
	
	//지출결의내역요청용
	public ArrayList<SignDocument> expenseList(PageInfo pi);
	
	//지출결의내역 게시글수 조회용
	public int selectElistCount();
	
	//지출결의내역 월조회 게시글수 조회용
	public int searchListCount(SignDateSearch sds);
	
	//지출결의내역 월조회 게시글 조회용
	public ArrayList<SignDocument> searchList(PageInfo pi,SignDateSearch sds);
	
	
	//결재- 결재자 상태 변경용
	public int updateSign(Signer si);
	
	//결재 - 결재문서 상태 변경용
	public int updateSignDoc(Signer si);

	//결재라인 등록요청용 
	public int insertSigner(Signer si);
	
	//기안등록
	public int insertDocument(SignDocument sd);
	
	//기안문서 첨부파일 등록용
	public int insertSignAttachment(SignAttachment st);
	
	//사용자 잔여연차 조회용
	public int selectRemainHoliday(String empId);
}
