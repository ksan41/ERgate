package com.kh.ergate.sign.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
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
	  
	  @RequestMapping("signDetail.si") public String signDetail(String documentNo,String signTypeNo,SignDocument sdd, Model model) {
		  
		  sdd.setDocumentNo(Integer.parseInt(documentNo));
		  sdd.setSignTypeNo(signTypeNo);
		  
		  SignDocument sd = siService.signDetail(sdd);
		  
		  ArrayList<SignAttachment> saList = siService.signDetailAttachment(sdd);
		  
		  model.addAttribute("sd",sd);
		  return "sign/signDetailExpense";
	  }
	  
	  // 진행결재함요청용
	  
	  @RequestMapping("ongoingList.si") public String ongoingList(SignDocument sd,
	  Model model) { return "sign/signOngoingList"; }
	  
	  // 진행결재함 월선택용
	  
	  @RequestMapping("ongoingListM.si") public String ongoingListMonth(String
	  month, SignDocument sd, Model model) {
	  
	  }
	  
	  // 상신내역요청용
	  
	  @RequestMapping("reportList.si") public String reportList(SignDocument sd,
	  Model model) { return "sign/signReportList"; }
	  
	  // 상신내역 월선택용
	  
	  @RequestMapping("reportListM.si") public String reportListMonth(String month,
	  SignDocument sd, Model model) {
	  
	  }
	  
	  // 지출결의내역요청용
	  
	  @RequestMapping("expenseList.si") public String expenseList(int currentPage,
	  SignDocument sd, Model model) {
	  
	  int listCount = siService.selectElistCount();
	  
	  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
	  
	  ArrayList<SignDocument> list = siService.expenseList(pi);
	  
	  SignDateSearch sds = null;
	  
	  model.addAttribute("sds",sds);
	  model.addAttribute("pi", pi); 
	  model.addAttribute("list", list);
	  
	  return "sign/signExpenseList"; }
	  
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
	  
	  @RequestMapping("hrList.si") public String hrList(SignDocument sd, Model
	  model) {
	  
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
	  
	  @RequestMapping("formSelect.si") public String formSelectPage() { return
	  "sign/signFormMain"; }
	  
	  // 기안작성폼-지출결의서 요청용
	  
	  @RequestMapping("expenseForm.si") public String expenseForm(HttpSession
	  session, Model model) { return "sign/signFormExpense"; }
	  
	  // 기안작성폼-휴가계 요청용
	  
	  @RequestMapping("annualForm.si") public String annualForm(HttpSession
	  session, Model model) { return "sign/signFormAnnualVacation"; }
	  
	  // 기안작성폼-외근신청서 요청용
	  
	  @RequestMapping("businessForm.si") public String businessForm(HttpSession
	  session, Model model) { return "sign/signFormBusinessTrip"; }
	  
	  // 결재라인 팝업 요청용
	  
	  @RequestMapping("approval.si") public String approvalPath() { return
	  "sign/signApprovalPath"; }
	  
	  // 결재라인 등록요청용
	  
	  @RequestMapping("insertSigner.si") public String insertSigner(Signer si,
	  Model model) {
	  
	  }
	  
	  // 기안임시저장
	  
	  @RequestMapping("saveDoc.si") public String saveDocument(SignDocument sd,
	  Model model) {
	  
	  }
	  
	  // 기안등록
	  
	  @RequestMapping("insertDoc.si") public String insertDocument(SignDocument sd,
	  Model model) {
	  
	  }
	 

}
