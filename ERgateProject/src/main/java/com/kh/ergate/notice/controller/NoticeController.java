package com.kh.ergate.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;
import com.kh.ergate.notice.model.service.NoticeServiceImpl;
import com.kh.ergate.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noService;
	
	// 공지사항 리스트조회용
	@RequestMapping("list.no")
	public String selectNoticeList(int currentPage, Model model) {
		
		int listCount = noService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> list = noService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "notice/noticeList";
	}
	
	//공지사항 검색용
	@RequestMapping("search.no")
	public String searchNoticeList(String condition,String keyword,int currentPage,Model model) {
		SearchCondition sc = new SearchCondition();
		
		switch(condition) {
		case "boardTitle" : sc.setBoardTitle(keyword);  break;
		case "boardContent" : sc.setBoardContent(keyword); break;
		case "boardWriter" : sc.setBoardWriter(keyword); break;
		}
		
		
		
		int searchListCount = noService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Notice> slist = noService.searchNoticeList(sc,pi);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);	// 검색된 값인지 일반 게시글 리스트인지 구별하기 위한 값 반환 (sc가 1이면 검색결과, sc라는 키값이 없으면 일반 글목록)
		return "notice/noticeList";
	}
	
	//공지사항상세조회용
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno,ModelAndView mv, int currentPage) {
		int result = noService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = noService.selectNotice(nno); 
			mv.addObject("n", n);
			mv.addObject("currentPage", currentPage);
			mv.setViewName("notice/noticeDetail");
		}else { // 게시글 상세조회 실패
			mv.addObject("msg", "공지사항 상세조회 실패!"); 
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항상세-첨부파일 조회용
	@ResponseBody
	@RequestMapping(value="detailFile.no", produces="application/json; charset=utf-8")
	public String fileList(int refBoardNo) {
		
		ArrayList<BoardAttachment> list = noService.fileList(refBoardNo);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="beforeAfter.no", produces="application/json; charset=utf-8")
	public String beforAfter(int refBoardNo) {
		
		ArrayList<Notice> list = new ArrayList<>();
		list.add(noService.beforeB(refBoardNo));
		list.add(noService.afterB(refBoardNo));
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		return new GsonBuilder().setDateFormat("yyyy/MM/dd").create().toJson(list);
	}
	
	  //공지사항작성폼 요청용
	  @RequestMapping("enrollForm.no") 
	  public String enrollForm() {
		  return "notice/noticeEnrollForm";
	  }
	  
	  //공지사항등록용
	  @ResponseBody
	  @RequestMapping(value="insert.no", produces="application/json; charset=utf-8")
	  public int insertNotice(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {
			//System.out.println(files.length);
			String title[] = form.getParameterValues("noticeTitle");
			String content[] = form.getParameterValues("noticeContent");
			String writer[] = form.getParameterValues("noticeWriter");
			String empId[] = form.getParameterValues("empId");
			//System.out.println("제목값은? : " + title[0]); 
			//System.out.println("내용값은? : " + content[0]);
			//System.out.println("이름은? : " + content[0]);
			Notice insertB = new Notice();
			insertB.setNoticeTitle(title[0]);
			insertB.setNoticeContent(content[0]);
			insertB.setNoticeWriter(writer[0]);
			insertB.setEmpId(empId[0]);
			
			int result = 0;
			result = noService.insertNotice(insertB);
			String resources = form.getSession().getServletContext().getRealPath("resources");
			String filePath = resources + "\\uploadFiles\\board\\";
			if(files.length > 0) {
				int flag = 0;
				int setFlag = 0;
				for(int i=0; i<files.length; i++) {
					setFlag = (int)(Math.random()*99) + 10;
					if(setFlag != flag) {
						flag = setFlag;
					}else {
						setFlag += 100;
						flag = setFlag;
					} // 혹시나 Math.random이 같은 값이 나올경우를 대비해서~
					String changeName = saveFile(files[i], form, flag);
					BoardAttachment bt = new BoardAttachment();
					bt.setChangeName(changeName);
					bt.setOriginName(files[i].getOriginalFilename());
					bt.setBoardFileSize(String.valueOf(files[i].getSize()));
					bt.setBoardFilePath(filePath);
					result += noService.insertNoticeAttachment(bt);
				}
			}else {
				result = noService.updateNoticeFlag();
			}
			
			
			return result;
	  }
	  
/*	  //공지사항수정폼
	  
	  @RequestMapping("updateForm.no") public String updateForm(int nno) {
	  
	  }
	  
	  //공지사항수정용
	  
	  @RequestMapping("update.no") public String
	  updateNotice(Notice,Model,MultipartFile,HttpServletRequest) {
	  
	  }
	  
	  //공지사항삭제용
	  
	  @RequestMapping("delete.no") public String deleteNotice(int nno,String
	  fileName,HttpServletRequest request,Model model) {
	  
	  }*/
	  
	  
	  // 파일 저장용 
	  public String saveFile(MultipartFile file, HttpServletRequest request, int flag) {
	  
	  String resources =
	  request.getSession().getServletContext().getRealPath("resources"); 
	  String savePath = resources + "\\uploadFiles\\board\\"; // 원본명 (aaa.jpg) 
	  String originName = file.getOriginalFilename();
	  
	  // 수정명 (20200522202011.jpg) 
	  String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	  
	  // 반복시의 구별값 currentTime += flag;
	  
	  // 확장자 (String ext) 
	  String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
	  
	  String changeName = currentTime + ext;
	  
	  
	  try { 
		  file.transferTo(new File(savePath + changeName)); 
	  } catch(IllegalStateException | IOException e) { 
		  e.printStackTrace(); } 
	  	
	  return changeName; 
	  
	  }
	  
	  // 파일 삭제용 
	  public void deleteFile(String fileName, HttpServletRequest request){ 
		  String resources = request.getSession().getServletContext().getRealPath("resources"); 
		  String savePath = resources + "\\uploadFiles\\board\\"; 
		  File deleteFile = new File(savePath + fileName); deleteFile.delete(); 
	  }
	 
}
