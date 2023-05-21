package semi.project.jsnr.admin.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.admin.model.service.AdminService;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.matching.model.vo.Matching;
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
									  @RequestParam(value="searchType", required=false) String searchType,
									  @RequestParam(value="searchText", required=false) String searchText,
									  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
		int listCount = aService.getMemberCount(map);
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Member> mList = aService.selectMemberList(pi, map);
		
		for(int i = 0; i < mList.size(); i++) {
			int mNo = mList.get(i).getMemberNo();
			int aCount = aService.getAnimalCount(mNo);
			mList.get(i).setAnimalCount(aCount);
		}
		
		if(mList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
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
		
		int applyJibsa = aService.selectApplyJibsa(mId);
		if(applyJibsa > 0) {
			m.setApplyJibsa("Y");
		} else {
			m.setApplyJibsa("N");
		}
		
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
		int result = aService.updateMember(m);
		if( result > 0 ) {
			model.addAttribute("page", page);
			return "redirect:admin_Member_Manage.ad";
		} else {
			System.out.println("멤버정보 업데이트 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_Members_update.ad")
	public String admin_Members_update(@RequestParam(value="page", required=false) Integer page,
									   @RequestParam(value="select", required=false) ArrayList<String> selArr,
									   @RequestParam("selectType") String selectType,
									   Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesMember(selArr);  
			}else {
				result = aService.activesMember(selArr);  
			}
			
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_Member_Manage.ad";
			} else {
				System.out.println("멤버정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_Member_Manage.ad";
		}
	}
			
	@GetMapping("admin_Jibsa_Manage.ad")
	public String admin_Jibsa_Manage(@RequestParam(value="page", required=false) Integer page,
								     @RequestParam(value="searchType", required=false) String searchType,
								     @RequestParam(value="searchText", required=false) String searchText,
			 						 Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
		int listCount = aService.getJibsaCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Jibsa> jList = aService.selectJibsaList(pi, map);
		
		if(jList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
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

		String[] sArr = new String[7];
		String[] eArr = new String[7];
		for(int i = 0; i < 7; i++) {
			sArr[i] = (j.getAvailableHour().split(",")[i]).substring(0, 2)
					 +":"+(j.getAvailableHour().split(",")[i]).substring(2, 4);
		}
		for(int i = 0; i < 7; i++) {
			eArr[i] = (j.getAvailableHour().split(",")[i]).substring(4, 6)
					+":"+(j.getAvailableHour().split(",")[i]).substring(6, 8);
		}
		
		Image image = aService.selectJibsaImage(j.getMemberNo());
		
		if(j != null) {
			model.addAttribute("image", image);
			model.addAttribute("page", currentPage);
			model.addAttribute("j", j);
			model.addAttribute("sArr", sArr);
			model.addAttribute("eArr", eArr);
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
		m.setIsJibsa(j.getJibsaStatus());
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
	
	@PostMapping("admin_Jibsas_update.ad")
	public String admin_Jibsas_update(@RequestParam(value="page", required=false) Integer page,
									  @RequestParam(value="select", required=false) ArrayList<String> selArr,
									  @RequestParam("selectType") String selectType,
									  Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesJibsa(selArr);  
			}else {
				result = aService.activesJibsa(selArr);  
			}
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_Jibsa_Manage.ad";
			} else {
				System.out.println("집사정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_Jibsa_Manage.ad";
		}
	}
	
	@GetMapping("admin_Review_Manage.ad")
	public String admin_Review_Manage(@RequestParam(value="page", required=false) Integer page,
									  @RequestParam(value="searchType", required=false) String searchType,
								      @RequestParam(value="searchText", required=false) String searchText,
									  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
		int listCount = aService.getReviewCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> rList = aService.selectReviewList(pi, map);
		if(rList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			return "admin_Review_Manage";
		} else {
			System.out.println("Review LIST정보 불러오기 실패함");
			return "";
		}
	}
	
	@GetMapping("admin_Review_Detail.ad")
	public String admin_Review_Detail(@RequestParam(value="page", required=false) Integer page,
									  @RequestParam("rId") int rId,
			  						  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		Board r = aService.selectReview(rId);
		if(r != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("r", r);
			System.out.println(r);
			return "admin_Review_Detail";
		} else {
			System.out.println("Review LIST정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_Review_Update.ad")
	public String admin_Review_Update(@RequestParam(value="page", required=false) Integer page,
								   	  @ModelAttribute Board b,
								   	  Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int result = aService.updateReview(b);
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_Review_Manage.ad";
		} else {
			System.out.println("Review정보 update 실패함");
			return "";
		}
		
	}
	
	@PostMapping("admin_Reviews_Update.ad")
	public String admin_Reviews_Update(@RequestParam(value="page", required=false) Integer page,
									   @RequestParam(value="select", required=false) ArrayList<String> selArr,
									   @RequestParam("selectType") String selectType,
									   Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesReview(selArr);  
			}else {
				result = aService.activesReview(selArr);  
			}
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_Review_Manage.ad";
			} else {
				System.out.println("리뷰정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_Review_Manage.ad";
		}
	}
	
	@GetMapping("admin_Matching_Manage.ad")
	public String admin_Matching_Manage(@RequestParam(value="page", required=false) Integer page,
										@RequestParam(value="searchType", required=false) String searchType,
									    @RequestParam(value="searchText", required=false) String searchText,
										Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
//		Board라는 객체로 review정보와 매칭정보를 모두 가지고 있으므로, 
//		일단 Review와 같은 메소드를 사용.
//		추후 값이 달라질 경우, 생성할것.
		int listCount = aService.getReviewCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> mcList = aService.selectReviewList(pi, map);
		if(mcList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			model.addAttribute("pi", pi);
			model.addAttribute("mcList", mcList);
			return "admin_Matching_Manage";
		} else {
			System.out.println("Matching LIST정보 불러오기 실패함");
			return "";
		}
	}

	@GetMapping("admin_Matching_Detail.ad")
	public String admin_Matching_Detail(@RequestParam(value="page", required=false) Integer page,
									  	@RequestParam("mcId") int mcId,
									  	Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
//		Board라는 객체로 review정보와 매칭정보를 모두 가지고 있으므로, 
//		일단 같은 메소드를 사용.
//		추후 값이 달라질 경우, 생성할것.
		Board mc = aService.selectReview(mcId);
		if(mc != null) {
			model.addAttribute("page", currentPage);
			model.addAttribute("mc", mc);
			return "admin_Matching_Detail";
		} else {
			System.out.println("Matching LIST정보 불러오기 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_Matching_Update.ad")
	public String admin_Matching_Update(@RequestParam(value="page", required=false) Integer page,
										@ModelAttribute Matching mc,
										Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		System.out.println(mc.getStartDate());
		System.out.println(mc.getEndDate());
		
		int result = aService.updateMatching(mc);
		if(result > 0) {
			model.addAttribute("page", currentPage);
			return "redirect:admin_Matching_Manage.ad";
		} else {
			System.out.println("Matching update 실패함");
			return "";
		}
	}	
	
	@PostMapping("admin_Matchings_Update.ad")
	public String admin_Matchings_Update(@RequestParam(value="page", required=false) Integer page,
										 @RequestParam(value="select", required=false) ArrayList<String> selArr,
										 @RequestParam("selectType") String selectType,
										 Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesMatching(selArr);  
			}else {
				result = aService.activesMatching(selArr);  
			}
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_Matching_Manage.ad";
			} else {
				System.out.println("매칭정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_Matching_Manage.ad";
		}
	}
	
	@GetMapping("admin_FAQ_Manage.ad")
	public String admin_FAQ_Manage(@RequestParam(value="page", required=false) Integer page,
								   @RequestParam(value="searchType", required=false) String searchType,
								   @RequestParam(value="searchText", required=false) String searchText,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
		int listCount = aService.getFaqCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Faq> fList = aService.selectFaqList(pi, map);
		if(fList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			model.addAttribute("pi", pi);
			model.addAttribute("fList", fList);
			return "admin_FAQ_Manage";
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
			return "redirect:admin_FAQ_Manage.ad";
		} else {
			System.out.println("FAQ정보 업데이트 실패함");
			return "";
		}
	}
	
	@PostMapping("admin_FAQs_Update.ad")
	public String admin_FAQs_Update(@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="select", required=false) ArrayList<String> selArr,
									@RequestParam("selectType") String selectType,
									Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesFAQ(selArr);  
			}else {
				result = aService.activesFAQ(selArr);  
			}
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_FAQ_Manage.ad";
			} else {
				System.out.println("FAQ정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_FAQ_Manage.ad";
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
			return "redirect:admin_FAQ_Manage.ad";
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
			return "redirect:admin_FAQ_Manage.ad";
		}else {
			System.out.println("에러 페이지로 연결");
			return "";
		}
		
	}
	
	@GetMapping("admin_QNA_Manage.ad")
	public String admin_QNA_Manage(@RequestParam(value="page", required=false) Integer page,
								   @RequestParam(value="searchType", required=false) String searchType,
								   @RequestParam(value="searchText", required=false) String searchText,
								   Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		
		int listCount = aService.getQnaCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Qna> qList = aService.selectQnaList(pi, map);
		if(qList != null) {
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchText", searchText);
			model.addAttribute("pi", pi);
			model.addAttribute("qList", qList);
			System.out.println(qList);
			return "admin_QNA_Manage";
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
			return "redirect:admin_QNA_Manage.ad";
		} else {
			System.out.println("QNA정보 update 실패함");
			return "";
		}
		
	}
	
	@PostMapping("admin_QNAs_Update.ad")
	public String admin_QNAs_Update(@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="select", required=false) ArrayList<String> selArr,
									@RequestParam("selectType") String selectType,
									Model model) {
		if(selArr != null) {
			int result = 0;
			if(selectType.equals("delete")) {
				result = aService.deletesQNA(selArr);  
			}else {
				result = aService.activesQNA(selArr);  
			}
			if( result > 0) {
				model.addAttribute("page", page);
				return "redirect:admin_QNA_Manage.ad";
			} else {
				System.out.println("QNA정보 업데이트 실패함");
				return "";
			}
		}else {
			model.addAttribute("page", page);
			return "redirect:admin_QNA_Manage.ad";
		}
	}
	
	
		

}
