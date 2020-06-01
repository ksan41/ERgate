package com.kh.ergate.board.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ergate.board.model.service.BoardService;
import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bodService;

	@RequestMapping("list.bo")
	public String selectList(int currentPage, Model model) {

		int listCount = bodService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Board> list = bodService.selectList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "board/boardList";
	}
	
	@RequestMapping("search.bo")
	public String searchBoardList(String condition, String keyword, Model model) {
		
		SearchCondition sc = new SearchCondition();
		
		switch(condition) {
		case "title" : sc.setBoardTitle(keyword);  break;
		case "content" : sc.setBoardContent(keyword); break;
		case "writer" : sc.setBoardWriter(keyword); break;
		}
		
		
		
		int searchListCount = bodService.searchListCount(sc);
		System.out.println(searchListCount);
		
		return "board/boardList";
	}

	/*
	 * @RequestMapping("enrollForm.bo") public String enrollForm() { return
	 * "board/boardEnrollForm"; }
	 * 
	 * @RequestMapping("insert.bo") public String insertBoard(Board b,
	 * HttpServletRequest request,
	 * 
	 * @RequestParam(name="uploadFile", required=false) MultipartFile file) {
	 * 
	 * //System.out.println(b); //System.out.println(file.getOriginalFilename()); //
	 * 첨부파일 있을 경우 원본명 / 첨부파일 없을 경우 빈문자열
	 * 
	 * // 파일업로드 관련된 라이브러리 추가해야만 잘 담김!!
	 * 
	 * // 현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 b 주섬주섬 담기
	 * if(!file.getOriginalFilename().equals("")) {
	 * 
	 * // 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것 String changeName =
	 * saveFile(file, request);
	 * 
	 * b.setOriginName(file.getOriginalFilename()); b.setChangeName(changeName);
	 * 
	 * }
	 * 
	 * int result = bService.insertBoard(b);
	 * 
	 * if(result > 0) { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지
	 * 
	 * 
	 * return "redirect:list.bo?currentPage=1";
	 * 
	 * }else { // 게시글 작성 실패 // 메세지 return "common/errorPage"; }
	 * 
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("detail.bo") public ModelAndView selectBoard(int bno,
	 * ModelAndView mv) {
	 * 
	 * int result = bService.increaseCount(bno);
	 * 
	 * if(result > 0) {
	 * 
	 * Board b = bService.selectBoard(bno); mv.addObject("b", b);
	 * mv.setViewName("board/boardDetailView");
	 * 
	 * }else { // 게시글 상세조회 실패
	 * 
	 * mv.addObject("msg", "게시글 상세조회 실패!"); mv.setViewName("common/errorPage");
	 * 
	 * }
	 * 
	 * return mv;
	 * 
	 * }
	 * 
	 * @RequestMapping("delete.bo") public String deleteBoard(int bno, String
	 * fileName, HttpServletRequest request, Model model) {
	 * 
	 * int result = bService.deleteBoard(bno);
	 * 
	 * if(result > 0) { // 게시글 삭제 성공 --> 기존의 첨부파일이 있었을 경우 서버에 삭제
	 * 
	 * // 기존의 첨부파일이 있었을 경우(fileName에 빈문자열이 아닐꺼임)만 서버에 업로드된 파일 삭제
	 * if(!fileName.equals("")) { deleteFile(fileName, request); }
	 * 
	 * return "redirect:list.bo?currentPage=1";
	 * 
	 * }else { // 게시글 삭제 실패
	 * 
	 * model.addAttribute("msg", "게시글 삭제 실패!!"); return "common/errorPage";
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("updateForm.bo") public String updateForm(int bno, Model
	 * model) {
	 * 
	 * model.addAttribute("b", bService.selectBoard(bno)); return
	 * "board/boardUpdateForm";
	 * 
	 * }
	 * 
	 * @RequestMapping("update.bo") public String updateBoard(Board b,
	 * HttpServletRequest request, Model model,
	 * 
	 * @RequestParam(name="reUploadFile", required=false) MultipartFile file) {
	 * 
	 * // 새로 넘어온 첨부파일이 있을 경우 --> 서버에 업로드 해야됨
	 * if(!file.getOriginalFilename().equals("")) {
	 * 
	 * // 기존의 첨부파일의 있었을 경우 --> 업로드 된 파일 지워야 됨 if(b.getChangeName() != null) { // 새로
	 * 넘어온 첨부파일도 있고 기존의 첨부파일도 있었을 경우 deleteFile(b.getChangeName(), request); }
	 * 
	 * String changeName = saveFile(file, request);
	 * 
	 * b.setChangeName(changeName); b.setOriginName(file.getOriginalFilename());
	 * 
	 * }
	 * 
	 * 
	 * b = 게시글번호, 게시글제목, 게시글내용
	 * 
	 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X --> originName : null, changeName : null
	 * 
	 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O --> 서버에 업로드 처리 후 --> originName : 새로첨부된파일원본명,
	 * changeName : 새로첨부된파일수정명
	 * 
	 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
	 * 
	 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O --> 기존의 첨부파일 삭제 후 --> 새로첨부된 파일 서버에 업로드 후 -->
	 * originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
	 * 
	 * 
	 * int result = bService.updateBoard(b);
	 * 
	 * if(result > 0) {
	 * 
	 * return "redirect:detail.bo?bno=" + b.getBoardNo();
	 * 
	 * }else { model.addAttribute("msg", "게시글 수정 실패!!"); return "common/errorPage";
	 * }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * // 전달받은 파일명을 가지고 서버로 부터 삭제하는 메소드 public void deleteFile(String fileName,
	 * HttpServletRequest request) { String resources =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = resources + "\\uploadFiles\\";
	 * 
	 * File deleteFile = new File(savePath + fileName); deleteFile.delete(); }
	 * 
	 * 
	 * // 공유해서 쓸수 있게끔 따로 정의 해놓은 메소드 // 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드 public
	 * String saveFile(MultipartFile file, HttpServletRequest request) {
	 * 
	 * // 파일을 업로드 시킬 폴더 경로 (String savePath) String resources =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = resources + "\\uploadFiles\\";
	 * 
	 * // 원본명 (aaa.jpg) String originName = file.getOriginalFilename();
	 * 
	 * // 수정명 (20200522202011.jpg) // 년월일시분초 (String currentTime) String currentTime
	 * = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //
	 * "20200522202011"
	 * 
	 * // 확장자 (String ext) String ext =
	 * originName.substring(originName.lastIndexOf(".")); // ".jpg"
	 * 
	 * String changeName = currentTime + ext;
	 * 
	 * 
	 * try { file.transferTo(new File(savePath + changeName)); } catch
	 * (IllegalStateException | IOException e) { e.printStackTrace(); }
	 * 
	 * return changeName;
	 * 
	 * }
	 */

}
