package com.kh.ergate.sign.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.vo.SignAttachment;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

public interface SignService {
	
	//결재대기리스트요청용
	public ArrayList<SignDocument> selectWaitingList(SignDocument sd);
	
	//결재상세 요청용
	public SignDocument signDetail(SignDocument sd);
	
	//결재상세-첨부파일 요청용
	public ArrayList<SignAttachment> signDetailAttachment(SignDocument sdd);
	
	//진행결재함요청용
	public ArrayList<SignDocument> ongoingList(String month,SignDocument sd);
	
	//상신내역요청용 
	public ArrayList<SignDocument> reportList(SignDocument sd);
	
	//지출결의내역요청용
	public ArrayList<SignDocument> expenseList(PageInfo pi);
	
	//지출결의내역 게시글수 조회용
	public int selectElistCount();
	
	//지출결의내역 월조회 게시글수 조회용
	public int searchListCount(SignDateSearch sds);
	
	//지출결의내역 월조회 게시글 조회용
	
	public ArrayList<SignDocument> searchList(PageInfo pi,SignDateSearch sds);
	
	//외근&휴가내역요청용 
	public ArrayList<SignDocument> hrList(SignDocument sd);
	
	//결재용
	public int updateSign(Signer si,SignDocument sd);
	
	//미결처리용
	public int noUpdateSign(Signer si,SignDocument sd);
	
	//결재라인 등록요청용 
	public int insertSigner(Signer si);
	
	//기안임시저장
	public int saveDocument(SignDocument sd);
	
	//기안등록
	public int insertDocument(SignDocument sd);

}
