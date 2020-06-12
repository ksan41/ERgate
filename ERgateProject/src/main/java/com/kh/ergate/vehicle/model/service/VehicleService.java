package com.kh.ergate.vehicle.model.service;

import java.util.ArrayList;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;
import com.kh.ergate.vehicle.model.vo.Vehicle;
import com.kh.ergate.vehicle.model.vo.VehicleReservation;

public interface VehicleService {
	
	// 업무차량 예약 현황 조회용 서비스 (일별)
	public ArrayList<VehicleReservation> currentStatusList(String date);
	
	// 나의 예약 현황 총 개수 조회용 서비스
	int selectReserveListCount(String empId);
	
	// 내 예약 조회용 서비스 ajax
	ArrayList<VehicleReservation> myReserveVehicle(String empId, PageInfo pi);
	
	// 차량 예약 현황 조회용 서비스 (일별)
	ArrayList<VehicleReservation> selectCurrentStatus(String currentDate);
	
	// 차량 예약용 서비스
	int reserveVehicle(VehicleReservation vr);
	
	// 차량 예약 취소용 서비스
	int cancelReserveVehicle(int vhclReserveNo);
	
	// 차량 예약 현황 조회용 서비스 (월별) - 관리자
	ArrayList<VehicleReservation> reserveVehicleList(String month, PageInfo pi);
	
	// 차량 리스트 총 개수 조회용 서비스
	int selectVehicleListCount();
	
	// 차량 리스트 조회용 서비스 - 관리자
	ArrayList<Vehicle> selectVehicleList(PageInfo pi);
	
	// 차량 등록용 서비스 - 관리자
	int insertVehicle(Vehicle v);
	
	// 차량 상세 조회용 서비스 - 관리자
	Vehicle selectVehicle(String vhclCode);
	
	// 차량 수정용 서비스 - 관리자
	int updateVehicle(Vehicle v);
	
	// 차량 삭제용 서비스 - 관리자
	int deleteVehicle(Vehicle v);

}
