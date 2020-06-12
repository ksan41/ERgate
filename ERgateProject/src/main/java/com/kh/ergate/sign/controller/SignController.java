package com.kh.ergate.sign.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.main.model.vo.Employee;
import com.kh.ergate.sign.model.service.SignServiceImpl;
import com.kh.ergate.sign.model.vo.SignAttachment;
import com.kh.ergate.sign.model.vo.SignDateSearch;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

@Controller
public class SignController {

	
	  @Autowired private SignServiceImpl siService;
	  
	  // 결재대기리스트
	  
	  @RequestMapping("waitingList.si") public String
	  selectWaitingList(SignDocument sd, Model model) { 
		  return "sign/signWaitingList"; 
	  }
	  
	  // 결재상세 요청용
	  
	  @RequestMapping("signDetail.si") public String signDetail(String documentNo,String signTypeNo,SignDocument sdd,SignAttachment sat, Model model) {
		  
		  sdd.setDocumentNo(Integer.parseInt(documentNo));
		  sdd.setSignTypeNo(signTypeNo);
		  
		  SignDocument sd = siService.signDetail(sdd);
		  ArrayList<Signer> sgList = siService.signDetailSigner(sdd);
		  ArrayList<SignAttachment> saList = siService.signDetailAttachment(sdd);
		  int sgCnt = 0;
		  
		  for(Signer sg : sgList) {
			  if(sg.getSignType() == 1) {
				  sgCnt ++;
			  }
		  }
		  
		  //System.out.println(sgCnt);
		  
		  model.addAttribute("sgCnt",sgCnt);
		  model.addAttribute("sgList",sgList);
		  model.addAttribute("saList",saList);
		  model.addAttribute("sd",sd);
		  
		  switch(signTypeNo) {
		  case 0:
		  case 1:
		
		  }
		  return "sign/signDetailExpense";
	  }
	  
	  // 진행결재함요청용
	  
	  @RequestMapping("ongoingList.si") 
	  public String ongoingList(int currentPage,HttpSession session,SignDocument sd,Model model) {
		  Employee e = (Employee)session.getAttribute("loginUser");
		  
		  int listCount = siService.selectOlistCount(e.getEmpId());
		  
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		  
		  ArrayList<SignDocument> list = siService.ongoingList(pi,e.getEmpId());
		  
		  model.addAttribute("pi",pi);
		  model.addAttribute("list",list);
		  return "sign/signOngoingList"; 
	  }
	  
	  
	  // 상신내역요청용
	  @RequestMapping("reportList.si") 
	  public String reportList(HttpSession session,SignDateSearch sds,int currentPage,Model model) {
		  Employee e = (Employee)session.getAttribute("loginUser");
		  
		  sds.setCondition(0);
		  sds.setEmpId(e.getEmpId());
		  
		  java.util.Date d = new java.util.Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyy/MM");
		  String sysdate = format.format(d);
		  String[] array = sysdate.split("/");
		  
		  sds.setYear(array[0]);
		  sds.setMonth(array[1]);
		  
		  int listCount = siService.selectRlistCount(sds);
		  
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		  
		  ArrayList<SignDocument> list = siService.reportList(pi,sds);
		  
		  
		  model.addAttribute("sds",sds);
		  model.addAttribute("pi", pi); 
		  model.addAttribute("list", list);
		  return "sign/signReportList"; 
	  }
	  
	  // 상신내역 월선택용
	  @RequestMapping("reportListM.si") 
	  public String reportListMonth(HttpSession session,SignDateSearch sds,Integer currentPage,SignDocument sd, Model model) {
		  Employee e = (Employee)session.getAttribute("loginUser");
		  
		  sds.setCondition(0);
		  sds.setEmpId(e.getEmpId());
		  int listCount = siService.selectRlistCount(sds);
		  
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage.intValue(), 5, 10);
		  
		  ArrayList<SignDocument> list = siService.searchList(pi,sds);
		  
		  model.addAttribute("pi",pi); 
		  model.addAttribute("sds",sds);
		  model.addAttribute("list",list); 
		  
		  return "sign/signReportList";
	  }
	  
	  // 지출결의내역요청용
	  
	  @RequestMapping("expenseList.si") public String expenseList(int currentPage,
	  SignDocument sd, Model model) {
	  
	  int listCount = siService.selectElistCount();
	  
	  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
	  
	  ArrayList<SignDocument> list = siService.expenseList(pi);
	  
	  SimpleDateFormat sformat = new SimpleDateFormat("yyyy/MM/dd");
	  	  
	  SignDateSearch sds = null;
	  
	  model.addAttribute("sds",sds);
	  model.addAttribute("pi", pi); 
	  model.addAttribute("list", list);
	  return "sign/signExpenseList"; 
	  }
	  
	  
	  // 지출결의내역 월선택용
	  @RequestMapping("expenseListM.si") 
	  public String expenseListMonth(SignDateSearch sds, Integer currentPage, SignDocument sd, Model model) {
		  
		  sds.setCondition(1);
		  int listCount = siService.searchListCount(sds);
		  
		  
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage.intValue(), 5, 10);
		  
		  ArrayList<SignDocument> list = siService.searchList(pi,sds);
		  
		  model.addAttribute("pi",pi); 
		  model.addAttribute("sds",sds);
		  model.addAttribute("list",list); 
		  
		  return "sign/signExpenseList";
			
	  }
	  
	  // 외근&휴가내역요청용
	  
	  @RequestMapping("hrList.si") public String hrList(int currentPage,SignDocument sd, Model
	  model) {
		  return "sign/signHRlist";
	  }
	  
	  // 외근휴가 월선택용
	  
	  @RequestMapping("hrListM.si") public String hrListMonth(String month,
	  SignDocument sd, Model model) {
	  
	  }
	  
	  // 결재용
	  
	  @RequestMapping("sign.si") public String updateSign(Signer si, SignDocument
	  sd, Model model) {
	  
	  }
	  
	  // 미결처리용
	  
	  @RequestMapping("noSign.si") public String noUpdateSign(Signer si,
	  SignDocument sd, Model model) {
	  
	  }
	  
	  // 기안작성폼메인요청용
	  
	  @RequestMapping("formSelect.si") 
	  public String formSelectPage() { 
		  return "sign/signFormMain"; 
	  }
	  
	  
	  // 기안작성폼-지출결의서 요청용
	  @RequestMapping("expenseForm.si") 
	  public String expenseForm(Model model) {
		  
		 String documentNo = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // "20200522202011" 
		 documentNo += Integer.toString((int)Math.random()*100+1);
		 
		 
		 model.addAttribute("documentNo",documentNo);
		 return "sign/signFormExpense";
	  }
	  
	  // 기안작성폼-휴가계 요청용
	  @RequestMapping("annualForm.si") 
	  public String annualForm(String empId,Model model){
		  
		  // 문서번호 랜덤값으로 생성
		  String documentNo = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // "20200522202011" 
		  documentNo += Integer.toString((int)Math.random()*100+1);
		  
		  // 사용자 잔여 연차정보 불러오기
		  int remainDay = siService.selectRemainHoliday(empId);
		  
		  model.addAttribute("remainDay",remainDay);
		  model.addAttribute("documentNo",documentNo);
		  return "sign/signFormAnnualVacation"; 
	  }
	  
	  
	  // 기안작성폼-외근신청서 요청용
	  @RequestMapping("businessForm.si") 
	  public String businessForm(Model model) { 
		  String documentNo = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // "20200522202011" 
		  documentNo += Integer.toString((int)Math.random()*100+1);
			 
			 
		  model.addAttribute("documentNo",documentNo);
		  return "sign/signFormBusinessTrip"; 
	  }
	  
	  
	  // 결재라인 팝업 요청용
	  @RequestMapping("approval.si") public String approvalPath() { 
		  return "sign/signApprovalPath"; 
	  }
	  
	  
	  //결재라인등록팝업 요청용
	  @RequestMapping("openSigner.si")
	  public String openSigner(String documentNo,HttpSession session,Model model) {
		  
		  model.addAttribute("documentNo",documentNo);
		  return "sign/signApprovalPath";
	  }
	  	  
	  
	  // 기안등록
	  @ResponseBody
	  @RequestMapping(value="insertDoc.si", produces="application/json; charset=utf-8") 
	  public int insertDocument(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {
		  
		  String documentNo[] = form.getParameterValues("documentNo"); // int형변환
		  
		  String signTypeNo[] = form.getParameterValues("signTypeNo");
		  String empId[] = form.getParameterValues("empId"); // 기안자 아이디
		  String signTypeName[] = form.getParameterValues("signTypeName");
		  String empName[] = form.getParameterValues("empName"); //기안자 이름
		  String deptTitle[] = form.getParameterValues("deptTitle"); // 기안자 부서명
		  String signTitle[] = form.getParameterValues("signTitle");
		  String signContent[] = form.getParameterValues("signContent");
		  String expenseStartDate[] = form.getParameterValues("expenseStartDate");
		  String expenseEndDate[] = form.getParameterValues("expenseEndDate");
		  String holidayType[] = form.getParameterValues("holidayType");
		  String holidayStart[] =form.getParameterValues("holidayStart");
		  String holidayEnd[] =form.getParameterValues("holidayEnd");
		  String holidayUsecount[] = form.getParameterValues("holidayUsecount");
		  
		  SignDocument sd = new SignDocument();
		  
		  // 지출결의서일 경우
		  if(form.getParameterValues("expenseStartDate") != null) {		
			Date start = java.sql.Date.valueOf(expenseStartDate[0]);
			Date end = java.sql.Date.valueOf(expenseEndDate[0]);
			sd.setExpenseStartDate(start);
			sd.setExpenseEndDate(end);
		  	}
		  
			
			  // 휴가계일 경우 
		  	  if(form.getParameterValues("holidayType") != null) {
			  //System.out.println("휴가계 요청");
		  		  switch(holidayType[0]) {
		  		  case "0": sd.setHolidayType("연차");break;
		  		  case "1": sd.setHolidayType("오전반차");break;	  	
		  		  case "2": sd.setHolidayType("오후반차");break;
		  		  case "3": sd.setHolidayType("경조사");break;
		  		  case "4": sd.setHolidayType("공가");break;
		  		  case "5": sd.setHolidayType("병가");break;
		  		  case "6": sd.setHolidayType("휴직");break;
		  		  }
				  sd.setHolidayStart(holidayStart[0]);
				  sd.setHolidayEnd(holidayEnd[0]); 
				  sd.setHolidayUsecount(holidayUsecount[0]); 
			  }
			  
		  	  
			  // 결재문서 공통부분 
	  		  sd.setDocumentNo(Long.parseLong(documentNo[0]));
			  sd.setSignTypeNo(signTypeNo[0]); 
			  sd.setEmpId(empId[0]);
			  sd.setSignTypeName(signTypeName[0]); 
			  sd.setEmpName(empName[0]);
			  sd.setDeptTitle(deptTitle[0]); 
			  sd.setSignTitle(signTitle[0]);
			  sd.setSignContent(signContent[0]);
			  
			  int result = 1;
			  
			  result = siService.insertDocument(sd);
			  
			  String signerId[] = form.getParameterValues("signerId"); 
			  String signerName[] = form.getParameterValues("signerName"); 
			  String refId[] = form.getParameterValues("refId"); 
			  String refName[] = form.getParameterValues("refName");
			  
			  String[] spSid = signerId[0].split(",");
			  String[] spSname = signerName[0].split(",");
			  String[] spRid = refId[0].split(",");
			  String[] spRname = refName[0].split(",");
			  
			  if(result>0) {
			  // 결재자 등록 
				  int signTurn = 1; 
				  for(int i=0;i<spSid.length;i++) { 
					  Signer s = new Signer(); 
					  s.setDocumentNo(Long.parseLong(documentNo[0]));
					  s.setEmpId(spSid[i]); 
					  s.setEmpName(spSname[i]); 
					  s.setSignType(1);
					  s.setSignTurn(signTurn++);			  
					  result *= siService.insertSigner(s); 
				  }
				  
				  // 수신참조자 등록 
				  for(int i=0;i<spRid.length;i++) { 
					  Signer s = new Signer();
					  s.setDocumentNo(Long.parseLong(documentNo[0])); 
					  s.setEmpId(spRid[i]);
					  s.setEmpName(spRname[i]); 
					  s.setSignType(0); 
					  s.setSignTurn(0);
				  
					  result *= siService.insertSigner(s); 
				  }
			  }
			  
			  // 첨부파일 있을 경우 insert 진행
			  if(files.length > 0) { 
				  int flag = 0;
				  for(int i=0; i<files.length;i++){
					  int setFlag = (int)(Math.random()*99) + 10;
					  if(setFlag != flag) {
							flag = setFlag;
						}else {
							setFlag += 100;
							flag = setFlag;
						} // 혹시나 Math.random이 같은 값이 나올경우를 대비해서~
					String changeName = saveFile(files[i], form,flag); 
					SignAttachment st = new SignAttachment(); 
					st.setRefDocNo(Long.parseLong(documentNo[0]));
					st.setChangeName(changeName);
					st.setOriginName(files[i].getOriginalFilename()); 
					result *= siService.insertSignAttachment(st); 
				} 
			  }
			 
		  return result;
	  }
	 
	  
	  public String saveFile(MultipartFile file, HttpServletRequest request,int flag) {
			
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\uploadFiles\\sign\\";
			
			// 원본명 (aaa.jpg)
			String originName = file.getOriginalFilename();
			
			// 수정명 (20200522202011.jpg)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
			
			currentTime += Integer.toString((int)Math.random()*100+1);
			
			// 반복시의 구별값
			currentTime += flag;
			
			// 확장자 (String ext)
			String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
			
			String changeName = currentTime + ext;
			
					
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return changeName;
		}
}
