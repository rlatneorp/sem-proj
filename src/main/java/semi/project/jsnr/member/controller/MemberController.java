package semi.project.jsnr.member.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.service.JibsaService;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.member.model.exception.MemberException;
import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes({"loginUser", "animal", "rList"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private JibsaService jService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	// 예약 관리
	@GetMapping("member_Reservation.me")
	public String reservation(@RequestParam(value="page", required=false) Integer page,
							  Model model, @ModelAttribute Board b) {
		Member m = (Member)model.getAttribute("loginUser");
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.reservationListCount(m.getMemberNo());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> rList = mService.selectReserList(m.getMemberNo(), pi);
		
		if(rList != null) {
			model.addAttribute("rList", rList);
			model.addAttribute("pi", pi);
			
			return "member_Reservation_Main";
		} else {
			throw new MemberException("예약 조회 실패");
		}
	}
	
	// 매칭 상세
	@RequestMapping("reservationDetail.me")
	public String reservationDetail(@RequestParam("matchingNo") int matchingNo,
									@RequestParam("jibsaNo") int jibsaNo, Model model,
									HttpSession session) {
		model.addAttribute("matchingNo", matchingNo);
		Member m = (Member)model.getAttribute("loginUser");
		
		ArrayList<JibsaProfile> jList = mService.selectReserJibsa();
		
		ArrayList<Board> rList = mService.selectReserList(m.getMemberNo());
		
		// 해당 집사의 오픈 카톡방 주소 가져오기
		Jibsa jChat = jService.selectJibsaChat(jibsaNo);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", jibsaNo);
		map.put("type", 2);
		Image img = jService.selectImage(map);
		
		if(!jList.isEmpty()) {
			model.addAttribute("jList", jList);
			model.addAttribute("rList", rList);
			model.addAttribute("chat", jChat.getChatAddress());
			model.addAttribute("image", img);
			
			return "member_Reservation_Detail";
		} else {
			throw new MemberException("상세보기 실패");
		}
	}
	
	// 매칭 취소
	@RequestMapping("cancelMatching.me")
	public String cancelMatching(@RequestParam("matchingNo") int matchingNo, Model model) {
		int result = mService.cancelMatching(matchingNo);
		
		if(result > 0) {
			return "redirect:member_Reservation.me";
		} else {
			throw new MemberException("매칭 취소 실패");
		}
	}

	@RequestMapping("writeReview.me")
	public String writeReview(@RequestParam("matchingNo") int matchingNo, Model model) {
		model.addAttribute("matchingNo", matchingNo);
		return "member_Review";
	}
	
	@RequestMapping("insertReview.me")
	public String insertReview(@ModelAttribute Board b, Model model) {
		int result = mService.insertReview(b);
		
		if(result > 0) {
			model.addAttribute("matchingNo", b.getMatchingNo());
			return "redirect:member_Reservation.me";
		} else {
			throw new MemberException("리뷰 작성 중 에러 발생");
		}
	}
	
	@RequestMapping("editReview.me")
	public String editReview(@RequestParam("matchingNo") int matchingNo, Model model) {
		model.addAttribute("matchingNo", matchingNo);
		
		ArrayList<Board> reviewList = (ArrayList<Board>) model.getAttribute("rList");
		Board review = null;

		for (Board board : reviewList) {
		    if (board.getMatchingNo() == matchingNo) {
		        review = board;
		        break;
		    }
		}

		if (review != null) {
			model.addAttribute("b", review);
		    
		    return "member_Review_Detail";
		} else {
			throw new MemberException("리뷰 조회 실패");
		}
		
	}
	
	@RequestMapping("updateReview.me")
	public String updateReview(@ModelAttribute Board b, Model model) {
		int result = mService.updateReview(b);
		
		if(result > 0) {
			model.addAttribute("matchingNo", b.getMatchingNo());
			
			return "redirect:member_Reservation.me";
		} else {
			throw new MemberException("리뷰 수정 실패");
		}
	}
	
	@RequestMapping("deleteReview.me")
	public String deleteReview(@ModelAttribute Board b, Model model) {
		int result = mService.deleteReview(b);
		
		if(result > 0) {
			return "redirect:member_Reservation.me";
		} else {
			throw new MemberException("후기 삭제 실패");
		}
	}
	
	@GetMapping("member_ServiceCenter.me")
	public String serviceCenter(@RequestParam(value="page", required=false) Integer page,
								@ModelAttribute("loginUser") Member m,
								Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMemberQnaListCount(m.getMemberNo());
//		int listCount = mService.getMemberQnaListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Faq> fList = mService.getMemberFaqList();
		ArrayList<Qna> qList = mService.getMemberQnaList(m.getMemberNo());
//		ArrayList<Qna> qList = mService.getMemberQnaList(1);
		
//		Faq는 페이징처리하지 않을 것이기 때문에, Qna에 대한 PageInfo만 넘김
		if(fList != null && qList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("fList", fList);
			model.addAttribute("qList", qList);
		}
		System.out.println(fList);
		System.out.println(qList);
		return "member_FAQ";
	}
	
	
	@GetMapping("member_QnA_Detail.me")
	public String member_QnA_Detail(@RequestParam("qId") int qId,
									Model model) {
		Qna q = mService.getQnaSelect(qId);
		
		if( q != null) {
			model.addAttribute("q", q);
		}
		System.out.println(q);
		return "member_QnA_Detail";
	}
	
	@GetMapping("member_QnA_Edit.me")
	public String member_QnA_Edit(@RequestParam("qId") int qId,
								  Model model) {
		Qna q = mService.getQnaSelect(qId);
		
		if( q != null) {
			model.addAttribute("q", q);
		}
		System.out.println(q);
		return "member_QnA_Edit";
	}
	
	@PostMapping("member_QnA_Update.me")
	public String member_QnA_Update(@ModelAttribute Qna q,
									Model model) {
		
		int result = mService.updateQna(q);
		
		Qna newQ = mService.getQnaSelect(q.getQnaNo());
		
		if( result > 0 && newQ != null) {
			model.addAttribute("q", newQ);
			
			return "member_QnA_Detail";
		} else {
			System.out.println("에러 페이지로 연결");
			return "";
		}
	}
	
	@GetMapping("member_QnA_delete.me")
	public String member_QnA_delete(@RequestParam("qId") String encodeQId) {
		
		Decoder decoder = Base64.getDecoder();
		byte[] byteArr = decoder.decode(encodeQId);
		String decode = new String(byteArr);
		int qId = Integer.parseInt(decode);
		
		int result = mService.deleteQna(qId);
		
		if(result > 0) {
			return "redirect:member_ServiceCenter.me";
		}else {
			System.out.println("에러 페이지로 연결");
			return "";
		}
		
	}
	
	@GetMapping("member_QnA_Write.me")
	public String member_QnA_Write() {
		return "member_QnA_Write";
	}
	
	@PostMapping("member_QnA_Insert.me")
	public String member_QnA_Insert(@ModelAttribute Qna q) {
		
		int result = mService.insertQna(q);
		
		System.out.println(q);
		if(result > 0) {
			return "redirect:member_ServiceCenter.me";
		}else {
			System.out.println("에러 페이지로 연결");
			return "";
		}
	}
	
	// 회원 정보수정 뷰로
	@GetMapping("member_EditInfo.me")
	public String member_editInfo() {
		return "member_Edit";
	}
	
	// 회원 회원가입 시 아이디 중복 체크
	@GetMapping("member_CheckMemberId.me")
	@ResponseBody
	public String member_checkMemberId(@RequestParam("memberId") String memberId) {
		int count = mService.checkMemberId(memberId);
		
		String result = count == 0 ? "yes" : "no";
		
		return result;
	}
	
	// 회원 정보 수정 처리 - 현지
	@RequestMapping("member_UpdateInfo.me")
	public String member_updateInfo(@ModelAttribute Member m, Model model) {
		int result = mService.updateInfo(m);
		
		if(result > 0) {
			Member updateMember = mService.login(m);
			model.addAttribute("loginUser", updateMember);
			
			return "redirect:member_EditInfo.me";
		} else {
			throw new MemberException("정보 수정에 실패하였습니다.");
		}
	}
	
	// 회원 마이페이지 - 정보수정에서 비번 재설정 - 현지
	@RequestMapping("member_UpdatePwd.me")
	public String member_updatePwd(@RequestParam("memberPwd") String pwd, 
								   @RequestParam("memberNewPwd") String newpwd, Model model) {
		
		// 세션에 있는 loginUser 정보 m에 담기
		Member m = (Member)model.getAttribute("loginUser");
		
		if(bcrypt.matches(pwd, m.getMemberPwd())) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberId", m.getMemberId());
			map.put("newPwd", bcrypt.encode(newpwd));
			int result = mService.updatePwd(map);
			if(result > 0) {
				Member update = mService.login(m);
				model.addAttribute("loginUser", update);
				
				return "redirect:member_EditInfo.me";
			} else {
				throw new MemberException("비밀번호 변경에 실패하였습니다.");
			}
		} else {
			throw new MemberException("비밀번호 수정에 실패하였습니다");
		} 
	} 
	
	// 회원 탈퇴 - 현지
	@GetMapping("member_DeleteInfo.do")
	public String member_deleteInfo(Model model) {
		String memberId = ((Member)model.getAttribute("loginUser")).getMemberId();
		
		int result = mService.deleteInfo(memberId);
		
		if(result > 0) {
			return "redirect:logout.do";
		} else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	@GetMapping("member_WithDrawal.me")
	public String member_WithDrawal() {
		return "member_WithDrawal";
	}
	
	@RequestMapping("joinNotice.do")
	public String enroll() {
		return "enroll/join_Notice";
	}
	
	@GetMapping("enrollPage.do")
	public String enrollPage() {
		return "enroll/join";
	}
	
	
	@RequestMapping("enrollMember.do")
	public String enrollMember(@ModelAttribute Member m, HttpSession session) {
		
		String encPwd = bcrypt.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		
		int result = mService.enrollMember(m);
		if(result>0) {
			return "redirect:home.do";
		} else {
			throw new MemberException("회원가입 실패");
		}
	}
	
}
