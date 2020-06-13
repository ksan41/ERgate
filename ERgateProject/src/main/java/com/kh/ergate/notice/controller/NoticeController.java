package com.kh.ergate.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ergate.board.model.vo.Board;
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
	/*
	 * //공지사항작성폼
	 * 
	 * @RequestMapping("enrollForm.no") public String enrollForm() {
	 * 
	 * }
	 * 
	 * //공지사항등록용
	 * 
	 * @RequestMapping("insert.no") public String insertNotice(Notice
	 * n,HttpServletRequest,Model model,HttpSession session,MultipartFile) {
	 * 
	 * }
	 * 
	 * //공지사항수정폼
	 * 
	 * @RequestMapping("updateForm.no") public String updateForm(int nno) {
	 * 
	 * }
	 * 
	 * //공지사항수정용
	 * 
	 * @RequestMapping("update.no") public String
	 * updateNotice(Notice,Model,MultipartFile,HttpServletRequest) {
	 * 
	 * }
	 * 
	 * //공지사항삭제용
	 * 
	 * @RequestMapping("delete.no") public String deleteNotice(int nno,String
	 * fileName,HttpServletRequest request,Model model) {
	 * 
	 * }
	 * 
	 * 
	 * // 파일 저장용 public String saveFile(MultipartFile file, HttpServletRequest
	 * request, int flag) {
	 * 
	 * String resources =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = resources + "\\uploadFiles\\board\\"; // 원본명 (aaa.jpg) String
	 * originName = file.getOriginalFilename();
	 * 
	 * // 수정명 (20200522202011.jpg) String currentTime = new
	 * SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	 * 
	 * // 반복시의 구별값 currentTime += flag;
	 * 
	 * // 확장자 (String ext) String ext =
	 * originName.substring(originName.lastIndexOf(".")); // ".jpg"
	 * 
	 * String changeName = currentTime + ext;
	 * 
	 * 
	 * try { file.transferTo(new File(savePath + changeName)); } catch
	 * (IllegalStateException | IOException e) { e.printStackTrace(); } return
	 * changeName; }
	 * 
	 * // 파일 삭제용 public void deleteFile(String fileName, HttpServletRequest request)
	 * { String resources =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = resources + "\\uploadFiles\\board\\"; File deleteFile = new
	 * File(savePath + fileName); deleteFile.delete(); }
	 */
}
