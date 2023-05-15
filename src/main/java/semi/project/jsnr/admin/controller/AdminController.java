package semi.project.jsnr.admin.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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

		model.addAttribute("page", currentPage);
		return "redirect:admin_Member_Manage.ad";
	}
	
	
	@GetMapping("admin_Member_Manage.ad")
	public String admin_Member_Manage(@RequestParam(value="page", required=false) Integer page,
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

	@GetMapping("admin_Member_Detail.ad")
	public String admin_Member_Detail(@RequestParam(value="mId", required=true) int mId,
									  @RequestParam(value="page", required=false) Integer page,
									  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Member m = aService.selectMember(mId);
		m.setAnimalCount(aService.getAnimalCount(mId));
		
		if(m != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("m", m);
			return "admin_Member_Detail";
		} else {
			System.out.println("멤버정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_Member_Update.ad")
	public String admin_Member_Update(@ModelAttribute Member m,
									  @RequestParam(value="page", required=false) Integer page,
									  Model model) {
		System.out.println(m);
		int result = aService.updateMember(m);
		if( result > 0 ) {
			model.addAttribute("page", page);
			return "redirect:admin_Member_Manage.ad";
		} else {
			System.out.println("멤버정보 업데이트 실패함");
			return "";
		}
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
			return "admin_Jibsa_Manage";
		} else {
			System.out.println("집사정보 불러오기 실패함");
			return "";
		}
	}
	
	@GetMapping("admin_Jibsa_Detail.ad")
	public String admin_Jibsa_Detail(@RequestParam(value="mId", required=true) int mId,
									 @RequestParam(value="page", required=false) Integer page,
									 Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Jibsa j = aService.selectJibsa(mId);

		if(j != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("j", j);
			return "admin_Jibsa_Detail";
		} else {
			System.out.println("집사정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_Jibsa_Update.ad")
	public String admin_Jibsa_Update(@ModelAttribute Jibsa j,
									 @RequestParam(value="page", required=false) Integer page,
									 Model model) {
		System.out.println(j);
		
		Member m = new Member();
		m.setMemberNo(j.getMemberNo());
		m.setMemberName(j.getMemberName());
		m.setIsJibsa(j.getIsJibsa());
		int result1 = aService.updateMember(m);
		
		int result2 = aService.updateJibsa(j);
		if( result1 > 0 && result2 > 0) {
			model.addAttribute("page", page);
			return "redirect:admin_Jibsa_Manage.ad";
		} else {
			System.out.println("집사정보 업데이트 실패함");
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
			return "admin_FAQ";
		} else {
			System.out.println("FAQ정보 불러오기 실패함");
			return "";
		}
		
	}
	
	@GetMapping("admin_FAQ_Detail.ad")
	public String admin_FAQ_Detail(@RequestParam(value="page", required=false) Integer page,
								   @RequestParam("fId") int fId,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		Faq f = aService.selectFaq(fId);
		if(f != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("f", f);
			return "admin_FAQ_Detail";
		} else {
			System.out.println("FAQ정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_FAQ_Update.ad")
	public String admin_FAQ_Update(@RequestParam(value="page", required=false) Integer page,
								   @ModelAttribute Faq f,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int result = aService.updateFaq(f);
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_FAQ.ad";
		} else {
			System.out.println("FAQ정보 업데이트 실패함");
			return "";
		}
	}
	
	@GetMapping("admin_FAQ_Write.ad")
	public String admin_FAQ_Write(@RequestParam(value="page", required=false) Integer page,
			   					  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		model.addAttribute("page", currentPage);
		return "admin_FAQ_Write";
	}
	
	@PostMapping("admin_FAQ_Insert.ad")
	public String admin_FAQ_Insert(@RequestParam(value="page", required=false) Integer page,
								   @ModelAttribute Faq f,
								   HttpSession session,
				 				   Model model) {
		int currentPage = 1;
		if(page != null) {
		currentPage = page;
		}
		
		f.setFaqWriter(((Member)session.getAttribute("loginUser")).getMemberNo()+"");
		
		int result = aService.insertFaq(f);
		System.out.println(f);
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_FAQ.ad";
		} else {
			System.out.println("FAQ정보 insert 실패함");
			return "";
		}
	}
	
	@GetMapping("admin_FAQ_Delete.ad")
	public String admin_FAQ_Delete(@RequestParam(value="page", required=false) Integer page,
								   @RequestParam("fId") String encodeFId,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Decoder decoder = Base64.getDecoder();
		byte[] byteArr = decoder.decode(encodeFId);
		String decode = new String(byteArr);
		int fId = Integer.parseInt(decode);
		
		int result = aService.deleteFaq(fId);
		
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_FAQ.ad";
		}else {
			System.out.println("에러 페이지로 연결");
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
			System.out.println("QNA LIST정보 불러오기 실패함");
			return "";
		}
		
	}
	
	@GetMapping("admin_QNA_Detail.ad")
	public String admin_QNA_Detail(@RequestParam(value="page", required=false) Integer page,
								   @RequestParam("qId") int qId,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Qna q = aService.selectQna(qId);
		if(q != null) {
			model.addAttribute("q", q);
			model.addAttribute("page", currentPage);
			return "admin_QNA_Detail";
		} else {
			System.out.println("QNA정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_QNA_Update.ad")
	public String admin_QNA_Update(@RequestParam(value="page", required=false) Integer page,
								   @ModelAttribute Qna q,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int result = aService.updateQna(q);
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_QNA.ad";
		} else {
			System.out.println("QNA정보 update 실패함");
			return "";
		}
		
	}
	
	
	
	
	
	
	
	
	
		

}
