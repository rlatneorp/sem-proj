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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginUser", "animal"})
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
	// 홈으로 가기
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		
	    return "home/home";
	}
	
	@RequestMapping("loginView.do")
	public String loginView() {
		return "login/login";
	}
	
	@RequestMapping("loginCheckInfo.do")
	@ResponseBody
	public String loginCheckInfo(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("memberPwd", memberPwd);
		
		int count = mService.loginCheckInfo(map);
		System.out.println(count);
		
		String result = count == 1 ? "yes" : "no";
		
		return result;
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
	
	// 로그인 비번 암호화 - 현지
	@PostMapping("login.do")
	public String login(Model model, @ModelAttribute Member m) {
		Member loginUser = mService.login(m);
		bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd());
		
		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:home.do";
		} else {
			return "login/loginFail";
		}
		
	}  
	
	// 로그아웃 - 현지
	@RequestMapping("logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();
		session.setAttribute("animal", null);
		session.setAttribute("image", null); // animal, image 세션 초기화
		
		return "redirect:home.do";
	}
	
	// 아이디 찾기 - 현지
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
	
	// 비밀번호 찾기 - 현지
	@RequestMapping("searchPwd.do")
	public String searchPwd(HttpSession session) {
		return "enroll/found_Pwd";
	}
	
	// 비밀번호 찾기 - 아이디, 이메일 확인 - 현지
	@RequestMapping("checkInfo.do")
	@ResponseBody
	public String checkInfo(@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("memberEmail", memberEmail);
		
		int count = mService.checkInfo(map);
		
		String result = count == 1 ? "yes" : "no";
		
		return result;
	}
	
	@RequestMapping("foundCheckId.do")
	@ResponseBody
	public String foundCheckId(@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberName", memberName);
		map.put("memberEmail", memberEmail);
		
		int count = mService.foundCheckId(map);
		
		String result = count == 1 ? "yes" : "no";
		
		return result;
	}
	
	// 비번 찾기 - 이메일 인증 - 현지
	@RequestMapping("foundPwd.do")
	public ModelAndView foundPwd(@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail,
						   		 HttpSession session) {
		Member m = mService.selectMember(memberId); // 아이디 일치하는 데이터 가져와서 m에 담기
		
		if(m != null) {
			Random r = new Random(); // 인증번호 랜덤숫자
			int num = r.nextInt(999999);
			
			if(m.getMemberId().equals(memberId)) {
				session.setAttribute("memberEmail", m.getMemberEmail());
				session.setAttribute("memberId", m.getMemberId());
				
				String setfrom = "jibsanara5@gmail.com"; // 발신자 이메일 주소
				String tomail = memberEmail;
				String title = "[집사나라] 비밀번호 변경 인증 이메일입니다.";  // 메일 제목
				String content = "<div style='margin:100px; text-align: center;'><h1>" + "안녕하세요" + "</h1>" +
								 "<h1>집사나라 입니다</h1>" + "<br><p>" + 
								 "아래 코드를 비밀번호 변경 창으로 돌아가 입력해주세요" + "</p><br><p>" +
								 "감사합니다!" + "</p><br>" +
								 "<div align='center' style='border:1px solid black; font-family:verdana';>" +
								 "<h3 style='color:blue;'>" + "비밀번호 변경 인증 코드입니다." + "</h3><div style='font-size:130%'>" +
								 "CODE : " + "<strong>" + num + "</strong><div><br/></div></div>";
				// System.getProperty : 개행 문자를 반환해주는 메소드
				// 개행 문자 : 줄바꿈 문자 신기쓰
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8"); // try catch 필요
					// MimeMessageHelper는 MimeMessage를 생성하고 조작하는 데 사용됨
					// MimeMessageHelper를 사용하여 MimeMessage를 조작하고, 메일의 다양한 속성 및 콘텐츠 (제목, 수신자, 본문 등)을 설정할 수 있음
					
					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content, true); // true : html코드적용
					// 발신자, 수신자, 제목, 내용 설정
					
					mailSender.send(message); // 메일 보내기
				} catch (MessagingException e) {
					System.out.println(e.getMessage());
				}
				// 성공하면 mv에 담아서 인증번호 받는 뷰로 보내기
				ModelAndView mv = new ModelAndView();
				mv.setViewName("enroll/pwd_Auth");
				mv.addObject("num", num);
				return mv;
			} else { // 실패하면 제자리
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
	
	// 비밀번호 찾기 - 인증번호 받기 - 현지
	@RequestMapping("pwd_Set.do")
	public String pw_Set(@RequestParam("emailAuth") String emailAuth,
						 @RequestParam("num") String num) {
		
		if(emailAuth.equals(num)) {
			return "enroll/pwd_ReSetting";
		} else {
			return "enroll/pwd_Auth";
		}
	}
	
	// 비번 찾기 - 새로운 비밀번호로 변경 - 현지
	@RequestMapping("pwd_New.do")
	public String pwd_New(@RequestParam("memberId") String memberId, @RequestParam("newPwd") String newPwd,
						  HttpSession session, Model model) {
		// 새로운 비번 암호화
		String encPwd = bcrypt.encode(newPwd);
		
		// id랑 암호화된 비번 map에 담아서 update 하기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("newPwd", encPwd);
		map.put("memberId", memberId);
		
		int result = mService.updateNewPwd(map);
		
		if(result > 0) {
			return "redirect:loginView.do";
		} else {
			System.out.println("updatePwd" + result);
			return "enroll/pwd_ReSetting";
		}
	}
	
	// 회원가입시 이메일 인증 - ajax 현지
	@RequestMapping("enrollAuth.do")
	@ResponseBody
	public String enrollAuth(@RequestParam("memberEmail") String memberEmail, HttpSession session) {
		if(memberEmail != null) {
			Random r = new Random(); // 랜덤 번호
			int num = r.nextInt(999999);
			
			String setfrom = "jibsanara5@gmail.com";
			String tomail = memberEmail;
			String title = "[집사나라] 회원 가입 인증 이메일입니다.";
			String content = "<div style='margin:100px; text-align: center;'><h1>" + "안녕하세요" + "</h1>" +
					 "<h1>집사나라 입니다</h1>" + "<br><p>" + 
					 "아래 코드를 회원가입 창으로 돌아가 입력해주세요" + "</p><br><p>" +
					 "집사나라에 오신걸 환영합니다!" + "</p><br>" +
					 "<div align='center' style='border:1px solid black; font-family:verdana;'>" +
					 "<h3 style='color:blue;'>" + "회원가입 인증 코드입니다." + "</h3><div style='font-size:130%'>" +
					 "CODE : " + "<strong>" + num + "</strong></div><br/></div></div>";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
				
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content, true);
				
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println(e.getMessage());
			}
			return Integer.toString(num); // 인증번호를 문자열로 변환해서 리턴하기
		} else {
			return "no";
		}
	}
}
