package com.kh.ergate.meetingroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mrDao")
public class MeetingroomDao {

	public int selectStatusList(SqlSessionTemplate sqlSession) {
		/* return sqlSession.selectStatusList ; */
	}

}
