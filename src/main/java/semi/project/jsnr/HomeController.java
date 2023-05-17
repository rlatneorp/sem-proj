package semi.project.jsnr;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 이메일 인증
	@Autowired
	private JavaMailSender mailSender;
	
	
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
			return "redirect:home.do";
		} else {
			return "login/login";
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();
		session.setAttribute("animal", null);
		session.setAttribute("image", null); // animal, image 세션 초기화
		
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
	
	@RequestMapping("foundPwd.do")
	public ModelAndView foundPwd(@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail,
						   		 HttpSession session) {
		Member m = mService.selectMember(memberEmail); // 이메일 일치하는 데이터 가져와서 m에 담기
		
		if(m != null) {
			Random r = new Random(); // 인증번호 랜덤숫자
			int num = r.nextInt(999999);
			
			if(m.getMemberId().equals(memberId)) {
				session.setAttribute("memberEmail", m.getMemberEmail());
				
				String setfrom = "jibsanara@naver.com"; // 보내는 주소....?
				String tomail = memberEmail;
				String title = "[집사나라] 비밀번호 변경 인증 이메일입니다.";  // 메일 제목
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + // 메일 내용
								 System.getProperty("line.separator") + "집사나라 인증번호는 " +
								 num + " 입니다." + System.getProperty("line.separator");
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8"); // try catch 필요
					
					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);
					
//					System.out.println(content);
					mailSender.send(message); // 메일 보내기
				} catch (MessagingException e) {
					System.out.println(e.getMessage());
				}
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("enroll/pwd_Auth");
				mv.addObject("num", num);
				return mv;
			} else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("enroll/found_Pwd");
				return mv;
			}
		} else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("enroll/found_Pwd");
			return mv;
		}
	}
	
	@RequestMapping("pwd_Set.do")
	public String pw_Set(@RequestParam("emailAuth") String emailAuth,
						 @RequestParam("num") String num) {
		
		if(emailAuth.equals(num)) {
			return "enroll/pwd_ReSetting";
		} else {
			return "enroll/pwd_Auth";
		}
	}
	
	@RequestMapping("pwd_New.do")
	public String pwd_New(@RequestParam("memberEmail") String memberEmail, @RequestParam("newPwd") String newPwd,
						  HttpSession session) throws IOException{
		Member m = (Member)session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("newPwd", newPwd);
		map.put("memberEmail", memberEmail);
		
		int result = mService.updateNewPwd(map);
		System.out.println(result);
		
		String encPwd = bcrypt.encode(newPwd);
		m.setMemberPwd(encPwd);
		System.out.println(encPwd);
		
		if(result > 0) {
	        session.setAttribute("encPwd", encPwd);
			
			return "redirect:loginView.do";
		} else {
			System.out.println("updatePwd" + result);
			return "enroll/pwd_New";
		}
	}

}
