package com.kh.ergate.vehicle.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.vehicle.model.dao.VehicleDao;

@Service("vService")
public class VehicleServiceImpl implements VehicleService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VehicleDao vDao;
	
}
