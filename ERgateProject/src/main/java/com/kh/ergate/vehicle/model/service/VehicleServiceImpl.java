package com.kh.ergate.vehicle.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.vehicle.model.dao.VehicleDao;
import com.kh.ergate.vehicle.model.vo.Vehicle;
import com.kh.ergate.vehicle.model.vo.VehicleReservation;

@Service("vService")
public class VehicleServiceImpl implements VehicleService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VehicleDao vDao;
	
	
	// 업무차량 예약 현황 조회용 서비스 (일별)
	@Override
	public ArrayList<VehicleReservation> currentStatusList(String date) {
		return vDao.currentStatusList(sqlSession, date);
	}
	
	// 나의 예약 현황 총 개수 조회용 서비스
	@Override
	public int selectReserveListCount(String empId) {
		return vDao.selectReserveListCount(sqlSession, empId);
	}
	
	// 내 예약 조회용 서비스 ajax
	@Override
	public ArrayList<VehicleReservation> myReserveVehicle(String empId, PageInfo pi) {
		return vDao.myReserveVehicle(sqlSession, empId, pi);
	}
		
	// 차량 예약 현황 조회용 서비스 (일별)
	@Override
	public ArrayList<VehicleReservation> selectCurrentStatus(String currentDate) {
		return vDao.selectCurrentStatus(sqlSession, currentDate);
	}

	// 차량 예약용 서비스
	@Override
	public int reserveVehicle(VehicleReservation vr) {
		return vDao.reserveVehicle(sqlSession, vr);
	}

	// 차량 예약 취소용 서비스
	@Override
	public int cancelReserveVehicle(int vhclReserveNo) {
		return vDao.cancelReserveVehicle(sqlSession, vhclReserveNo);
	}

	// 차량 예약 현황 조회용 서비스 (월별) - 관리자
	@Override
	public ArrayList<VehicleReservation> reserveVehicleList(String month, PageInfo pi) {
		return vDao.reserveVehicleList(sqlSession, month, pi);
	}
	
	// 차량 리스트 총 개수 조회용 서비스
	@Override
	public int selectVehicleListCount() {
		return vDao.selectVehicleListCount(sqlSession);
	}

	// 차량 리스트 조회용 서비스 - 관리자
	@Override
	public ArrayList<Vehicle> selectVehicleList(PageInfo pi) {
		return vDao.selectVehicleList(sqlSession, pi);
	}

	// 차량 등록용 서비스 - 관리자
	@Override
	public int insertVehicle(Vehicle v) {
		return vDao.insertVehicle(sqlSession, v);
	}
	
	// 차량 상세 조회용 서비스 - 관리자
	@Override
	public Vehicle selectVehicle(String vhclCode) {
		return vDao.selectVehicle(sqlSession, vhclCode);
	}

	// 차량 수정용 서비스 - 관리자
	@Override
	public int updateVehicle(Vehicle v) {
		return vDao.updateVehicle(sqlSession, v);
	}

	// 차량 삭제용 서비스 - 관리자
	@Override
	public int deleteVehicle(Vehicle v) {
		return vDao.deleteVehicle(sqlSession, v);
	}

}
