package com.kh.ergate.sign.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;

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
}
