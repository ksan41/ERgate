package com.kh.ergate.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ergate.board.model.service.BoardService;
import com.kh.ergate.board.model.vo.Board;
import com.kh.ergate.board.model.vo.BoardAttachment;
import com.kh.ergate.board.model.vo.ReReply;
import com.kh.ergate.board.model.vo.Reply;
import com.kh.ergate.board.model.vo.SearchCondition;
import com.kh.ergate.common.model.vo.PageInfo;
import com.kh.ergate.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bodService;

	@RequestMapping("list.bo")
	public String selectList(int currentPage, Model model, @RequestParam(value="deleteFlag", required=false, defaultValue="0") int flag) {

		int listCount = bodService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Board> list = bodService.selectList(pi);
		if(flag == 1) {
			model.addAttribute("msg", "게시글 삭제 성공");	
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "board/boardList";
	}
	
	@RequestMapping("search.bo")
	public String searchBoardList(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition();
		
		switch(condition) {
		case "boardTitle" : sc.setBoardTitle(keyword);  break;
		case "boardContent" : sc.setBoardContent(keyword); break;
		case "boardWriter" : sc.setBoardWriter(keyword); break;
		}
		
		
		
		int searchListCount = bodService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Board> slist = bodService.searchList(pi,sc);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);	// 검색된 값인지 일반 게시글 리스트인지 구별하기 위한 값 반환 (sc가 1이면 검색결과, sc라는 키값이 없으면 일반 글목록)
		return "board/boardList";
	}
	
	@RequestMapping("detail.bo") 
	public ModelAndView selectBoard(int bno, ModelAndView mv, int currentPage) {
	
		int result = bodService.increaseCount(bno);
	
		if(result > 0) {
			Board b = bodService.selectBoard(bno); 
			mv.addObject("b", b);
			mv.addObject("currentPage", currentPage);
			mv.setViewName("board/boardDetail");
		}else { // 게시글 상세조회 실패
			mv.addObject("msg", "게시글 상세조회 실패!"); 
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="detailFile.bo", produces="application/json; charset=utf-8")
	public String fileList(int refBoardNo) {
		
		ArrayList<BoardAttachment> list = bodService.fileList(refBoardNo);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String replyList(int refBno) {
		
		ArrayList<Reply> list = bodService.replyList(refBno);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="relist.bo", produces="application/json; charset=utf-8")
	public String rereplyList(int refRno) {
		
		ArrayList<ReReply> list = bodService.rereplyList(refRno);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="beforeAfter.bo", produces="application/json; charset=utf-8")
	public String beforAfter(int refBoardNo) {
		
		ArrayList<Board> list = new ArrayList<>();
		list.add(bodService.beforeB(refBoardNo));
		list.add(bodService.afterB(refBoardNo));
		return new GsonBuilder().setDateFormat("yyyy/MM/dd").create().toJson(list);
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@ResponseBody
	@RequestMapping(value="insert.bo", produces="application/json; charset=utf-8")
	public int insertBoard(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {
		String title[] = form.getParameterValues("boardTitle");
		String content[] = form.getParameterValues("boardContent");
		String writer[] = form.getParameterValues("boardWriter");
		String empId[] = form.getParameterValues("empId");

		Board insertB = new Board();
		insertB.setBoardTitle(title[0]);
		insertB.setBoardContent(content[0]);
		insertB.setBoardWriter(writer[0]);
		insertB.setEmpId(empId[0]);
		
		int result = 0;
		result = bodService.insertBoard(insertB);
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
				result += bodService.insertBoardAttachment(bt);
			}
		}else {
			result = bodService.updateBoardFlag();
		}
		
		
		return result;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, int flag) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\board\\";
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명 (20200522202011.jpg)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
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
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\board\\";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	@ResponseBody
	@RequestMapping(value="insertReply.bo", produces="application/json; charset=utf-8")
	public int insertReply(Reply repl) {
		int result = bodService.insertReply(repl);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="insertReReply.bo", produces="application/json; charset=utf-8")
	public String insertReReply(ReReply replForm) {
		int refRno = replForm.getRefRno();
	
		int result = bodService.insertReReply(replForm);
		ReReply rrepl = bodService.rereplyOne(refRno);
		
		return new GsonBuilder().setDateFormat("yyyy. MM. dd HH:mm:ss").create().toJson(rrepl);
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply.bo", produces="application/json; charset=utf-8")
	public int updateReply(Reply repl) {
		int result = bodService.updateReply(repl);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="updateReReply.bo", produces="application/json; charset=utf-8")
	public int updateReReply(ReReply repl) {
		int result = bodService.updateReReply(repl);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReply.bo", produces="application/json; charset=utf-8")
	public int deleteReply(int replyNo) {
		int result = bodService.deleteReply(replyNo);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="deleteReReply.bo", produces="application/json; charset=utf-8")
	public int deleteReReply(int replyNo) {
		int result = bodService.deleteReReply(replyNo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="checkHaveReply.bo", produces="application/json; charset=utf-8")
	public int checkHaveReply(int replyNo) {
		int result = bodService.checkHaveReply(replyNo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="replyForceDelete.bo", produces="application/json; charset=utf-8")
	public int replyForceDelete(int replyNo) {
		int result = bodService.replyForceDelete(replyNo);
		return result;
	}
	
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(int bno, int currentPage, ModelAndView mv) {

		Board b = bodService.selectBoard(bno);
		ArrayList<BoardAttachment> bt = bodService.fileList(bno);
			mv.addObject("b", b);
			mv.addObject("currentPage", currentPage);
			mv.addObject("btList", bt);
			mv.setViewName("board/boardEnrollForm");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="realUpdate.bo", produces="application/json; charset=utf-8")
	public int realUpdateBoard(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {

		String title[] = form.getParameterValues("boardTitle");
		String content[] = form.getParameterValues("boardContent");
		String writer[] = form.getParameterValues("boardWriter");
		String empId[] = form.getParameterValues("empId");
		String boardNo[] = form.getParameterValues("boardNo");
		String nowFnoTemp[] = form.getParameterValues("nowFno");
		
		Board insertB = new Board();
		insertB.setBoardTitle(title[0]);
		insertB.setBoardContent(content[0]);
		insertB.setBoardWriter(writer[0]);
		insertB.setEmpId(empId[0]);
		insertB.setBoardNo(Integer.parseInt(boardNo[0]));
		int deresult = 0;
		if(!nowFnoTemp[0].isEmpty()) {
			String [] nowFno = nowFnoTemp[0].split(",");
			for(int i=0; i<nowFno.length; i++) {
				BoardAttachment fileOne = bodService.fileOne(Integer.parseInt(nowFno[i]));
				deresult = bodService.fileDbDelete(Integer.parseInt(nowFno[i]));
				deleteFile(fileOne.getChangeName(), form);
			}
		}
		
		int result = 0;
		result = bodService.updateBoard(insertB);
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
				bt.setRefBoardNo(Integer.parseInt(boardNo[0]));
				result += bodService.insertBoardAttachment(bt);
			}
		}
		
		
		return result;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, Model model, HttpServletRequest request) {
		
		int result = bodService.deleteBoard(bno);
		if(result > 0) {
			ArrayList<BoardAttachment> list = new ArrayList<>();
			list = bodService.fileList(bno);
			String[] fileName = new String[list.size()];
			if(list.size() > 0) {
				for(int i=0; i<list.size(); i++) {
					fileName[i] = list.get(i).getChangeName();
					
					deleteFile(fileName[i], request);
				}
				
			}
			
			return "redirect:list.bo?currentPage=1&deleteFlag=1";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}

	}
	
	
	
	@ResponseBody
	@RequestMapping(value="nowFile.bo", produces="application/json; charset=utf-8")
	public String nowFileList(int fno, HttpServletRequest request) {
		
		 BoardAttachment fileOne = bodService.fileOne(fno); 
		 
		 String resources = request.getSession().getServletContext().getRealPath("resources");
		 String filePath = resources + "\\uploadFiles\\board\\";
		 String fileName=fileOne.getChangeName();
		 //MultipartFile nowFile = (MultipartFile) new File(filePath + fileName);
		 
		
		 return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(fileOne);
	}
	
	
	
	
	
	
	

}
