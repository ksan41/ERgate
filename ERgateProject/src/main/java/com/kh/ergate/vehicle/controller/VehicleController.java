package com.kh.ergate.vehicle.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		
		int listCount = vService.selectReserveListCount(e.getEmpId());
		
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

		int listCount = vService.selectVehicleListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Vehicle> list = vService.selectVehicleList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "vehicle/vehicleManagement";
	}
	
	// 차량 등록
	@RequestMapping("insert.ve")
	public String insertVehicle(Vehicle v, HttpSession session,
								@RequestParam(name="uploadFile", required=false) MultipartFile file,
								HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			v.setVhclImage(changeName);
		}
		
		int result = vService.insertVehicle(v);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 등록되었습니다.");
			return "redirect:vehicleList.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 등록에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:vehicleList.ve?currentPage=1";
		}
		
	}
	
	// 차량 수정
	@RequestMapping("update.ve")
	public String updateVehicle(Vehicle v, HttpSession session,
			   					@RequestParam(name="reUploadFile", required=false) MultipartFile file,
			   					HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(v.getVhclImage() != null) {
				deleteFile(v.getVhclImage(), request);
			}
			
			String changeName = saveFile(file, request);
			v.setVhclImage(changeName);
		}
		
		int result = vService.updateVehicle(v);
		
		if(result > 0) {
			session.setAttribute("msg", "성공적으로 업무 차량 수정되었습니다.");
			return "redirect:vehicleList.ve?currentPage=1";
		}else {
			session.setAttribute("msg", "업무 차량 수정에 실패하였습니다. 다시 시도해 주세요.");
			return "redirect:vehicleList.ve?currentPage=1";
		}
		
	}
	
	// 차량 삭제
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
	
	
	
	// ---------- 메소드 선언 ----------
	
	// 공유해서 쓸 수 있게끔 따로 정의해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로 (String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources"); // webapp 폴더의 resources 폴더까지의 물리적인 경로
		String savePath = resources + "\\uploadFiles\\vehicle\\"; // 실제로 저장되어있는 폴더 (resources 폴더 안 경로)
		
		
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명
		// 년월일시분초 (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		// 최종 수정명 (20200522202011.jpg)
		String changeName = currentTime + ext;
		
		
		// 서버에 파일을 업로드시키는 메소드
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		// (실행 후 리턴값 없음)
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\vehicle\\";
		
		File deleteFile = new File(savePath + fileName); // 삭제하고자 하는 풀 경로(경로+파일명)
		deleteFile.delete(); // 실제 서버의 파일 찾아 삭제 처리
		
	}
	

}
