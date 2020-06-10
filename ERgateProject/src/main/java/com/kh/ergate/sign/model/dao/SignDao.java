package com.kh.ergate.sign.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.vo.SignAttachment;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

@Repository("siDao")
public class SignDao {
	
	// 지출내역리스트 게시글조회용
	public int selectElistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("signMapper.selectElistCount");
	}
	
	// 지출결의내력 리스트 조회용
	public ArrayList<SignDocument> expenseList(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("signMapper.selectExpenseList",null,rowBounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession,SignDateSearch sds) {
		return sqlSession.selectOne("signMapper.searchListCount",sds);
	}
	
	public ArrayList<SignDocument> searchList(SqlSessionTemplate sqlSession,PageInfo pi, SignDateSearch sds){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("signMapper.searchList",sds,rowBounds);
	}
	
	public SignDocument signDetail(SqlSessionTemplate sqlSession,SignDocument sdd) {
		return sqlSession.selectOne("signMapper.signDetail",sdd);
	}
	
	public ArrayList<SignAttachment> signDetailAttachment(SqlSessionTemplate sqlSession,SignDocument sdd){
		return (ArrayList)sqlSession.selectList("signMapper.signAttachmentList",sdd);
	}
	
	public ArrayList<Signer> signDetailSigner(SqlSessionTemplate sqlSession,SignDocument sdd){
		return (ArrayList)sqlSession.selectList("signMapper.signDetailSigner",sdd);
	}
	
	public int insertDocument(SqlSessionTemplate sqlSession,SignDocument sd) {
		return sqlSession.insert("signMapper.insertDocument",sd);
	}
	
	public SignDocument selectMyDocument(SqlSessionTemplate sqlSession,String empId) {
		return sqlSession.selectOne("signMapper.selectMyDocument",empId);
	}
	
	// 결재라인 등록
	public int insertSigner(SqlSessionTemplate sqlSession,Signer si) {
		return sqlSession.insert("signMapper.insertSigner",si);
	}
	
	public int insertSignAttachment(SqlSessionTemplate sqlSession,SignAttachment st) {
		return sqlSession.insert("signMapper.insertSignAttachment",st);
	}
}
