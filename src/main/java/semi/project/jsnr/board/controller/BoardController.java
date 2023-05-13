package semi.project.jsnr.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.board.model.exception.BoardException;
import semi.project.jsnr.board.model.service.BoardService;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	
//	@GetMapping("reviewMain.bo")
//	public String selectBoardList(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		
//		int listCount = bService.getListCount(1);
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		
//		ArrayList<Board> list = bService.selectBoardList(pi, 1);
//		
//		if(list != null) {
//			model.addAttribute("pi", pi);
//			model.addAttribute("list", list);
//			return "review_Main";
//		} else {
//			throw new BoardException("게시글 조회를 실패하였습니다.");
//		}
//	}
	
	@GetMapping("reviewMain.bo")
	public String reviewBoardList(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.getListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<Board> list = bService.reviewBoardList(pi, 1);
		
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "review_Main";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
	}
	
	@GetMapping("jibsa_List.bo")
	public String jibsaList(@RequestParam(value="page", required=false) Integer page,
							Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getJibsaListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
		
		ArrayList<JibsaProfile> pList = bService.selectJibsaProfileList(pi);
				
		for(int i = 0; i < pList.size(); i++) {
			System.out.println(pList.get(i));
		}
		
		if(pList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("pList", pList);
		}
		return "jibsa_List";
	}
	
	@GetMapping("jibsa_Detail.bo")
	public String selectProfile(@RequestParam(value="page", required=false) Integer page,
								@RequestParam("mId") int mId,
								HttpSession session,
								Model model) {
		Jibsa jibsa = bService.getJibsaInfo(mId);
		JibsaProfile jp = bService.getJibsaProfile(mId);
		
		if(jibsa != null) {
			model.addAttribute("page", page);
			model.addAttribute("jibsa", jibsa);
			model.addAttribute("jp", jp);
			return "jibsa_Detail";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
		
	}
	
}
