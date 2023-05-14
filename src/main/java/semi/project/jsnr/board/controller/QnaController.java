package semi.project.jsnr.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.board.model.service.BoardService;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;

@Controller
public class QnaController {
	
	@Autowired
	private BoardService bService;
	
	@GetMapping("qna_Main.bo")
	public String qna_Main(@RequestParam(value="page", required=false) Integer page,
						   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getQnaListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Qna> qList = bService.selectQnaList(pi);
		ArrayList<Faq> fList = bService.selectFaqList(pi);
		
		
		if(qList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("qList", qList);
			model.addAttribute("fList", fList);
		}
		return "QnA_Main"; 
	}
	
	@GetMapping("qna_List.bo")
	public String qna_List(@RequestParam(value="page", required=false) Integer page,
						   HttpSession session,
			   			   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getQnaListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Qna> qList = bService.selectQnaList(pi);
		
		if(qList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("qList", qList);
		}
		return "QnA_List";
	}
}
