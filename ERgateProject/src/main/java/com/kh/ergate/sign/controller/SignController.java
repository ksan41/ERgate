package com.kh.ergate.sign.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ergate.sign.model.service.SignServiceImpl;
import com.kh.ergate.sign.model.vo.SignDocument;
import com.kh.ergate.sign.model.vo.Signer;

@Controller
public class SignController {
	
	@Autowired
	private SignServiceImpl siSevice;
	
	
	// 결재대기리스트
	@RequestMapping("waitingList.si")
	public String selectWaitingList(SignDocument sd,Model model) {
		return "sign/signWaitingList";
	}
	
	
	//결재상세 요청용
	@RequestMapping("signDetail.si")
	public String signDetail(SignDocument sd,Model model) {
		
	}
	
	
	// 진행결재함요청용
	@RequestMapping("ongoingList.si")
	public String ongoingList(SignDocument sd,Model model) {
		return "sign/signOngoingList";
	}
	
	//진행결재함 월선택용
	@RequestMapping("ongoingListM.si")
	public String ongoingListMonth(String month,SignDocument sd,Model model) {
		
	}
	
	//상신내역요청용
	@RequestMapping("reportList.si")
	public String reportList(SignDocument sd,Model model) {
		return "sign/signReportList";
	}
	 
	//상신내역 월선택용
	@RequestMapping("reportListM.si")
	public String reportListMonth(String month,SignDocument sd,Model model) {
		
	}
	
	//지출결의내역요청용
	@RequestMapping("expenseList.si")
	public String expenseList(SignDocument sd,Model model) {
		return "sign/signExpenseList";
	}
	
	//지출결의내역 월선택용
	@RequestMapping("expenseListM.si")
	public String expenseListMonth(String month,SignDocument sd,Model model) {
		
	}
	
	//외근&휴가내역요청용
	@RequestMapping("hrList.si")
	public String hrList(SignDocument sd,Model model) {
		
	}
	
	//외근휴가 월선택용
	@RequestMapping("hrListM.si")
	public String hrListMonth(String month,SignDocument sd,Model model) {
		
	}
	
	//결재용
	@RequestMapping("sign.si")
	public String updateSign(Signer si,SignDocument sd,Model model) {
		
	}
	
	//미결처리용
	@RequestMapping("noSign.si")
	public String noUpdateSign(Signer si,SignDocument sd,Model model) {
		
	}
	
	//기안작성폼메인요청용
	@RequestMapping("formSelect.si")
	public String formSelectPage(Model model) {
		
	}
	
	//기안작성폼-지출결의서 요청용
	@RequestMapping("expenseForm.si")
	public String expenseForm(HttpSession session,Model model) {
		
	}
	
	//기안작성폼-휴가계 요청용
	@RequestMapping("annualForm.si")
	public String annualForm(HttpSession session, Model model) {
		
	}
	
	
	//기안작성폼-외근신청서 요청용
	@RequestMapping("approvalForm.si")
	public String approvalForm(HttpSession session, Model model) {
		
	}
	
	//결재라인 등록요청용
	@RequestMapping("insertSigner.si")
	public String insertSigner(Signer si,Model model) {
		
	}
	
	//기안임시저장
	@RequestMapping("saveDoc.si")
	public String saveDocument(SignDocument sd, Model model) {
		
	}
	
	//기안등록
	@RequestMapping("insertDoc.si")
	public String insertDocument(SignDocument sd, Model model) {
		
	}

}
