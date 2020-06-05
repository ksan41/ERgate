package com.kh.ergate.vehicle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.vehicle.model.service.VehicleService;

@Controller
public class VehicleController {
	
	@Autowired
	private VehicleService vService;
	
	
	@RequestMapping("currentStatus.ve")
	public String selectCurrentStatus() {
		return "vehicle/vehicleCurrentStatus";
	}
	
	
	
	
	// ---------- 페이지 이동용 ----------

}
