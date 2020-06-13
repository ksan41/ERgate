package com.kh.ergate.vehicle.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.meetingroom.model.vo.MeetingroomReservation;
import com.kh.ergate.vehicle.model.vo.Vehicle;
import com.kh.ergate.vehicle.model.vo.VehicleReservation;

@Repository("vDao")
public class VehicleDao {
	
	public ArrayList<VehicleReservation> currentStatusList(SqlSessionTemplate sqlSession, String date){
		return (ArrayList)sqlSession.selectList("vehicleMapper.currentStatusList", date);
	}
	
	public int selectReserveListCount(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("vehicleMapper.selectReserveListCount", empId);
	}
	
	public ArrayList<VehicleReservation> myReserveVehicle(SqlSessionTemplate sqlSession, String empId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("vehicleMapper.myReserveVehicle", empId, rowBounds);
	}
	
	public ArrayList<VehicleReservation> selectCurrentStatus(SqlSessionTemplate sqlSession, String currentDate) {
		return (ArrayList)sqlSession.selectList("vehicleMapper.selectCurrentStatus", currentDate);
	}
	
	public int reserveVehicle(SqlSessionTemplate sqlSession, VehicleReservation vr) {
		return sqlSession.insert("vehicleMapper.reserveVehicle", vr);
	}
	
	public int cancelReserveVehicle(SqlSessionTemplate sqlSession, int vhclReserveNo) {
		return sqlSession.update("vehicleMapper.cancelReserveVehicle", vhclReserveNo);
	}
	
	public ArrayList<VehicleReservation> reserveVehicleList(SqlSessionTemplate sqlSession, String date, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("vehicleMapper.reserveVehicleList", date, rowBounds);
	}
	
	public int reserveVehicleListCount(SqlSessionTemplate sqlSession, String date) {
		return sqlSession.selectOne("vehicleMapper.reserveVehicleListCount", date);
	}
	
	public int selectVehicleListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("vehicleMapper.selectVehicleListCount");
	}
	
	public ArrayList<Vehicle> selectVehicleList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("vehicleMapper.selectVehicleList", null, rowBounds);
	}
	
	public Vehicle selectVehicle(SqlSessionTemplate sqlSession, String vhclCode) {
		return sqlSession.selectOne("vehicleMapper.selectVehicle", vhclCode);
	}
	
	public int insertVehicle(SqlSessionTemplate sqlSession, Vehicle v) {
		return sqlSession.insert("vehicleMapper.insertVehicle", v);
	}
	
	public int updateVehicle(SqlSessionTemplate sqlSession, Vehicle v) {
		return sqlSession.update("vehicleMapper.updateVehicle", v);
	}
	
	public int deleteVehicle(SqlSessionTemplate sqlSession, Vehicle v) {
		return sqlSession.update("vehicleMapper.deleteVehicle", v);
	}
	
}
