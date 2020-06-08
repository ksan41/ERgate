package com.kh.ergate.attendance.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.attendance.model.dao.AttendanceDao;

@Service("atService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao atDao;
}
