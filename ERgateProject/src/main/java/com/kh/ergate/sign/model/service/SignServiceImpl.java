package com.kh.ergate.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.sign.model.dao.SignDao;
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
	public SignDocument signDetail(SignDocument sd) {
		return null;
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

	@Override
	public ArrayList<SignDocument> expenseList(PageInfo pi) {
		return null;
	}
	
	@Override
	public int selectElistCount() {
		return siDao.selectElistCount(sqlSession);
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

	@Override
	public int insertSigner(Signer si) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int saveDocument(SignDocument sd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDocument(SignDocument sd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SignDocument> expenseList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}



}
