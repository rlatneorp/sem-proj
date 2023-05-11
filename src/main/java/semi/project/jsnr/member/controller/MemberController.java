package semi.project.jsnr.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@GetMapping("myPage.me")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping("home.do")
	public String home() {
		return "redirect:home/home";
	}
	
	@RequestMapping("loginView.do")
	public String loginView() {
		return "login/login";
	}
	
	@PostMapping("login.do")
	public String login(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd, Model model) {
		Member loginUser = mService.login(memberId);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			return "login/login";
		}
		
	}
	
//	// 암호화 할라해ㅔㅆ느데 실패했어요 도와주세요 흑흑
//	@PostMapping("login.do")
//	public String login(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd, Model model,
//						@ModelAttribute Member m) {
//		Member loginUser = mService.login(memberId);
//		
//		bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd());
//		
//		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
//			model.addAttribute("loginUser", loginUser);
//			return "redirect:home.do";
//		} else {
//			return "login/login";
//		}
//		
//	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
	
	
}
