package com.kh.ergate.sign.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("siDao")
public class SignDao {
	
	// 지출내역리스트 게시글조회용
	public int selectElistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("signMapper.selectElistCount");
	}
}
