package com.kh.ergate.group.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ergate.group.model.service.GroupService;
import com.kh.ergate.group.model.vo.Search;
import com.kh.ergate.main.model.vo.Employee;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService grService;
	
	
	// ------------- 페이지 이동 -------------
	// 1. 조직도리스트 요청용
	@RequestMapping(value="groupList.gr")
	public String selectGroupList(Model model) {
		return "group/groupList";
	}
	
	// 2. 계정관리페이지 요청용
	@RequestMapping(value="mgList.gr")
	public String selectMgList() {
		return "group/groupManagement";
	}
	

	
	
	
	// ------------- 서비스 요청 -------------
	// 3. 조직도 전제 사원 조회
	@ResponseBody
	@RequestMapping(value="empList.gr", produces="application/json; charset=utf-8")
	public String selectEmpList() {
		
		ArrayList<Employee> list = grService.selectEmpList();
		return new Gson().toJson(list);
	}
	
	// 4. 조직도 부서별 사원 조회
	@ResponseBody
	@RequestMapping(value="deptEmpList.gr", produces="application/json; charset=utf-8")
	public String selectDeptEmpList(String keyword) {
		
		ArrayList<Employee> array = grService.selectDeptEmpList(keyword);
		return new Gson().toJson(array);
	}
	
	// 5. 조직도 사원 프로필 조회 (오른쪽 영역)
	@ResponseBody
	@RequestMapping(value="empProfile.gr", produces="application/json; charset=utf-8" )
	public String selectEmpProfile(String empId) {
		
		Employee empPrf = grService.selectEmpProfile(empId);
		//return new Gson().toJson(empPrf);
		return new GsonBuilder().setDateFormat("yyyy/MM/dd").create().toJson(empPrf);
	}
	
	// 6. 조직도 키워드 검색 
	@ResponseBody
	@RequestMapping(value="empListSearch.gr", produces="application/json; charset=utf-8" )
	public String selectEmpListSearch(Search search) {
		
		ArrayList<Employee> array = grService.selectEmpListSearch(search);
		return new Gson().toJson(array);
	}
	
	// 7. 승인대기리스트 조회요청용
	@RequestMapping(value="requestList.gr")
	public String selectRequestList(Model model) {
		
		ArrayList<Employee> array = grService.selectRequestList();
		model.addAttribute("requestList", array);
		
		return "group/groupRequestList";
	}
	
	// 8. 승인대기 사원 프로필 상세 요청용
	@RequestMapping(value="requestDetail.gr")
	public String selectGroupRequestDetail(String empId, Model model) {

		Employee empPrf = grService.selectGroupRequestDetail(empId);
		model.addAttribute("empPrf", empPrf);
		return "group/groupRequestDetail";
	}
	
	// 8_1. 계정 승인 요청 
	@RequestMapping(value="requestEmp.gr")
	public String groupRequestDetail(Employee emp, HttpSession session) {
	
		System.out.println(emp);
		int result = grService.updateGroupEmp(emp);
		if(result>0) {
			session.setAttribute("msg", "계정을 승인했습니다.");
			return "redirect:requestList.gr";
		}else { // null 값이 인서트되므로 계정승인 실패시에도 성공 메세지 뜨고 리스트에서 안 없어지는 문제 있음 ㅠㅠ
			session.setAttribute("msg", "계정 승인을 실패하였습니다. 다시 시도해 주세요.");
			return "group/groupRequestDetail";
		}
	}
	
	// 9. 사원 계정 수정 상세 페이지
	@RequestMapping(value="groupProfileUpdateDetail.gr")
	public String updateGroupEmpDetail(String empId, Model model) {
		
		Employee empPrf = grService.selectEmpProfile(empId);
		//System.out.println(empPrf);
		model.addAttribute("empPrf", empPrf);
		return "group/groupProfileUpdate";
	}
	
	// 9_1. 사원 계정 수정 요청 
	@RequestMapping("groupProfileUpdate.gr")
	public String updateGroupEmp(Employee emp, HttpSession session) {
		
		//System.out.println(emp);
		int result = grService.updateGroupEmp(emp);
		if(result>0) {
			session.setAttribute("empId", emp.getEmpId());
			session.setAttribute("msg", "계정 수정이 성공적으로 완료되었습니다.");
			return "redirect:mgList.gr";
		}else {
			session.setAttribute("msg", "계정 수정에 실패하였습니다. 다시 시도해 주세요.");
			return "mgList.gr";
		}
	}

	// 10. 계정승인 거절용
	@RequestMapping("noUpdate.gr")
	public String noUpdateGroupEmp(String empId, HttpSession session) {
		// System.out.println(empId);
		int result = grService.noUpdateGroupEmp(empId);
		if(result>0) {
			session.setAttribute("msg", "계정 승인을 거절했습니다.");
			return "redirect:requestList.gr";
		} else {
			session.setAttribute("msg", "계정 삭제에 실패하였습니다. 다시 시도해 주세요.");
			return "requestList.gr";
		}
	}
	
	// 11. 조직도 주소록 엑셀 다운로드
	@RequestMapping("exel.gr")
	public void exelDown(HttpServletResponse response) {
		
		ArrayList <Employee> xlist = grService.exelDown();
		
		//for(int i=0; i<list.size(); i++) {
		//	System.out.println(list.get(i));
		//}
		
		//Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상
		
		// Sheet 생성
        //Sheet sheet1 = xlsxWb.createSheet("firstSheet");
	    // 워크북 생성

	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("게시판");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    // 헤더 생성
	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");

	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");

	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("부서");

	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("직급");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("직책");

	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("내선번호");
	    
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("팩스번호");
	    
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("휴대폰 번호");
	    
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상세주소");

	    // 데이터 부분 생성
	    for(int i=0; i<xlist.size(); i++) {

	        row = sheet.createRow(rowNo++);

	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpId());

	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpName());

	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getDeptTitle());

	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getRankTitle());
	        
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getJobTitle());

	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpExtension());
	        
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpFax());
	        
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpPhone());
	        
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpAddress());
	        
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(xlist.get(i).getEmpAddressDetail());
	    }

	    // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=empAddress.xls");

        // 엑셀 출력
        try {
			wb.write(response.getOutputStream());
			wb.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	
	
}
