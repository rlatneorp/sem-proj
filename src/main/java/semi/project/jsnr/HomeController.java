package semi.project.jsnr;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {

	    return "home/home";
	}
	
	@RequestMapping("loginView.do")
	public String loginView() {
		return "login/login";
	}
	
	// 암호화 X 혹시 몰라서 안 지움
//	@PostMapping("login.do")
//	public String login(@ModelAttribute Member m, Model model) {
//		Member loginUser = mService.login(m);
//		
//		if(loginUser != null) {
//			model.addAttribute("loginUser", loginUser);
//			return "redirect:home.do";
//		} else {
//			return "login/login";
//		}
//		
//	}
	
	// 비번 암호화
	@PostMapping("login.do")
	public String login(Model model, @ModelAttribute Member m) {
		Member loginUser = mService.login(m);
		
		bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd());
		
		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			model.addAttribute("loginUser", loginUser);
			System.out.println("loginUser");
			return "redirect:home.do";
		} else {
			return "login/login";
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
//		session.setAttribute("animal", null); // 남아있는 animal 객체도 초기화해야해서 넣었습니다..
		
		return "redirect:home.do";
	}
	
	// 아이디 찾기
	@GetMapping("searchId.do")
	public String searchId() {
		return "enroll/found_Id";
	}
	
	@PostMapping("foundId.do")
	public String foundId(@ModelAttribute Member m, Model model) {
		String memberId = mService.foundId(m);
		
		model.addAttribute("memberName", m.getMemberName());
		model.addAttribute("memberId", memberId);
		
		return "enroll/found_Id_Result";
	}
	
	// 비밀번호 찾기
	@GetMapping("searchPwd.do")
	public String searchPwd() {
		return "enroll/found_Pwd";
	}
	
	
	
	

}
