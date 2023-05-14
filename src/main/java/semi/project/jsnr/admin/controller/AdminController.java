package semi.project.jsnr.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.admin.model.service.AdminService;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@GetMapping("admin_Main.ad")
	public String admin_Main(@RequestParam(value="page", required=false) Integer page,
							 Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getMemberCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Member> mList = aService.selectMemberList(pi);
		
		if(mList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("mList", mList);
			return "admin_Member_Manage";
		} else {
			System.out.println("멤버정보 불러오기 실패함");
			return "";
		}
	}
	
	
	@GetMapping("admin_Member_Manage.ad")
	public String admin_Member_Manage() {
		return "redirect:admin_Main.ad";
	}
	
	@GetMapping("admin_Jibsa_Manage.ad")
	public String admin_Jibsa_Manage(@RequestParam(value="page", required=false) Integer page,
			 						 Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getJibsaCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Jibsa> jList = aService.selectJibsaList(pi);
		if(jList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("jList", jList);
			System.out.println(jList);
			return "admin_Jibsa_Manage";
		} else {
			System.out.println("집사정보 불러오기 실패함");
			return "";
		}
	}
	
	
	@GetMapping("admin_FAQ.ad")
	public String admin_FAQ(@RequestParam(value="page", required=false) Integer page,
							Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getFaqCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Faq> fList = aService.selectFaqList(pi);
		if(fList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("fList", fList);
			System.out.println(fList);
			return "admin_FAQ";
		} else {
			System.out.println("FAQ정보 불러오기 실패함");
			return "";
		}
		
	}
	
	@GetMapping("admin_QNA.ad")
	public String admin_QNA(@RequestParam(value="page", required=false) Integer page,
							Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getQnaCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Qna> qList = aService.selectQnaList(pi);
		if(qList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("qList", qList);
			System.out.println(qList);
			return "admin_QNA";
		} else {
			System.out.println("QNA정보 불러오기 실패함");
			return "";
		}
		
	}
	
	@GetMapping("admin_Modify_Jibsa.ad")
	public String admin_Modify_Jibsa() {
		return "admin_Modify_Jibsa";
	}
	
	@GetMapping("admin_Modify_Member.ad")
	public String admin_Modify_Member() {
		return "admin_Modify_Member";
	}
	
	@GetMapping("admin_Modify_Schedule.ad")
	public String admin_Modify_Schedule() {
		return "admin_Modify_Schedule";
	}
	
	@GetMapping("admin_QuestionList.ad")
	public String admin_QuestionList() {
		return "p_main";
	}
}
