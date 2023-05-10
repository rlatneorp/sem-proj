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
import org.springframework.web.bind.support.SessionStatus;

import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

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
	
	@RequestMapping("loginView.do")
	public String loginView() {
		return "login/login";
	}
	
	@PostMapping("login.do")
	public String login(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd, Model model) {
		System.out.println(memberId);
		System.out.println(memberPwd);
		Member loginUser = mService.login(memberId);
		
		System.out.println(loginUser);
		
//		bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd());
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:login/afterLogin";
		} else {
			return "login/login";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home";
	}
	
	
	
}
