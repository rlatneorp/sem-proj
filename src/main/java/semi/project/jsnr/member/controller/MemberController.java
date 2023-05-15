package semi.project.jsnr.member.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.HashMap;

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

import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.member.model.exception.MemberException;
import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@GetMapping("member_Reservation.me")
	public String reservation() {
		return "member_Reservation_Main";
	}
	
	@GetMapping("member_ServiceCenter.me")
	public String serviceCenter(@RequestParam(value="page", required=false) Integer page,
								@ModelAttribute("loginUser") Member m,
								Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
//		int listCount = mService.getMemberQnaListCount(m.getMemberNo());
		int listCount = mService.getMemberQnaListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Faq> fList = mService.getMemberFaqList();
//		ArrayList<Qna> qList = mService.getMemberQnaList(m.getMemberNo());
		ArrayList<Qna> qList = mService.getMemberQnaList(1);
		
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
			return "redirect:serviceCenter.me";
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
			return "redirect:serviceCenter.me";
		}else {
			System.out.println("에러 페이지로 연결");
			return "";
		}
	}
	
	@GetMapping("member_EditInfo.me")
	public String member_editInfo() {
		return "member_Edit";
	}
	
	@GetMapping("member_CheckMemberId.me")
	@ResponseBody
	public String member_checkMemberId(@RequestParam("memberId") String memberId) {
		int count = mService.checkMemberId(memberId);
		
		String result = count == 0 ? "yes" : "no";
		
		return result;
	}
	
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
	
	@RequestMapping("member_UpdatePwd.me")
	public String member_updatePwd(@RequestParam("memberPwd") String pwd, 
								   @RequestParam("memberNewPwd") String newpwd, Model model) {
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
	
	@PostMapping("enrollMember.do")
	public String enrollMember( @ModelAttribute Member m, 
								@RequestParam("emailId") String emailId, 
								@RequestParam("emailDomain") String emailDomain) {
		if(!emailId.trim().equals("")) {
			m.setMemberEmail(emailId + "@" + emailDomain);
		}
		
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
