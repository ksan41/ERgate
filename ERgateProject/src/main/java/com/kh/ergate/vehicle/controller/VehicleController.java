package com.kh.ergate.vehicle.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.vehicle.model.service.VehicleService;
import com.kh.ergate.vehicle.model.vo.Vehicle;
import com.kh.ergate.vehicle.model.vo.VehicleReservation;

@Controller
public class VehicleController {
	
	@Autowired
	private VehicleService vService;
	
	
	@RequestMapping("myReserve.ve")
	public String myReserveVehicle(int currentPage, Model model, HttpSession session) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		int listCount = vService.selectReserveListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<VehicleReservation> list = vService.myReserveVehicle(e, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "vehicle/vehicleCurrentStatus";
		
	}
	
	@RequestMapping("cancelReserve.ve")
	public String cancelReserveVehicle(String vhclReserveNo, HttpSession session) {
		
		int result = vService.cancelReserveVehicle(vhclReserveNo);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약 취소되었습니다.");
			return "redirect:myReserve.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "예약 취소 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:myReserve.ve?currentPage=1";
		}
		
	}
	
	@RequestMapping("reserve.ve")
	public String reserveVehicle(VehicleReservation vr, HttpSession session) {
		
		int result = vService.reserveVehicle(vr);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 예약되었습니다.");
			return "redirect:myReserve.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "예약 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:myReserve.ve?currentPage=1";
		}
		
	}
	
	@RequestMapping("currentStatus.ve")
	public String selectCurrentStatus() {
		return "vehicle/vehicleCurrentStatus";
	}
	
	@RequestMapping("reserveList.ve")
	public String reserveVehicleList() {
		return "vehicle/vehicleReservationList";
	}
	
	@RequestMapping("vehicleList.ve")
	public String selectVehicleList(int currentPage, Model model, HttpSession session) {

		int listCount = vService.selectReserveListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Vehicle> list = vService.selectVehicleList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "vehicle/vehicleManagement";
	}
	
	@RequestMapping("insert.ve")
	public String insertVehicle(Vehicle v, HttpSession session) {
		
		int result = vService.insertVehicle(v);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 등록되었습니다.");
			return "redirect:vehicleList.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 등록에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:vehicleList.ve?currentPage=1";
		}
		
	}
	
	@RequestMapping("update.ve")
	public String updateVehicle(Vehicle v, HttpSession session) {
		
		int result = vService.updateVehicle(v);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 수정되었습니다.");
			return "redirect:vehicleList.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 수정에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:vehicleList.ve?currentPage=1";
		}
		
	}
	
	@RequestMapping("delete.ve")
	public String deleteVehicle(Vehicle v, HttpSession session) {
		
		int result = vService.updateVehicle(v);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 삭제되었습니다.");
			return "redirect:vehicleList.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 삭제에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:vehicleList.ve?currentPage=1";
		}
		
	}

	
	
	// ---------- 페이지 이동용 ----------

}
