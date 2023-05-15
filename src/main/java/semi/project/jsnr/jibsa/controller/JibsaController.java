package semi.project.jsnr.jibsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.jibsa.model.exception.JibsaException;
import semi.project.jsnr.jibsa.model.service.JibsaService;
import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@Controller
public class JibsaController {
	@Autowired	//의존성 주입
	private JibsaService jService;
	private MemberService mService;
	
	
	
	@RequestMapping("enrollJibsa.js")
	public String enroll(@ModelAttribute Member m,
						Model model) {
		
			return "enrollJibsa";
	}
	
	@RequestMapping("enrollJibsaPage.js")
	public String enrollJibsaPage(@ModelAttribute Member m,
			Model model) {
		
		return "enrollJibsaPage";
	}
	
	@RequestMapping("enrollTrainerPage.js")
	public String enrollTrainerPage(@ModelAttribute Member m,
			Model model) {
		
		return "enrollTrainerPage";
	}
	
	@PostMapping("insertJibsa.js")
	public String insertJibsa(@ModelAttribute Member m, 
							Model model) {
		
		int result = jService.insertJibsa(m);
		
		if(result>0) {
			Member insertJibsa = mService.login(m);
			model.addAttribute("loginUser",insertJibsa);
			return " ";
		} else {
			throw new JibsaException("정보 수정 실패했습니다.");
		}
	}
	
	
	
	@RequestMapping("jibsaMain.js")
	public String jibsaMain() {
		return "jibsa_Main";
	}
	
	@GetMapping("jibsaManagementSchedule.js")
	public String jibsaManagementSchedule() {
		return "jibsaManagementSchedule";
	}
	
	@GetMapping("jibsaModifyInfo.js")
	public String jibsaModifyInfo() {
		return "jibsaModifyInfo";
	}
	
	@GetMapping("jibsaModifySchedule.js")
	public String jibsaModifySchedule() {
		return "jibsaModifySchedule";
	}
	
	@GetMapping("jibsaWorkTime.js")
	public String jibsaWorkTime() {
		return "jibsaWorkTime";
	}
	
	@GetMapping("personal.js")
	public String personal() {
		return "personal";
	}
	
	@GetMapping("premium.js")
	public String premium() {
		return "premium";
	}
	
	@GetMapping("review.js")
	public String review() {
		return "review";
	}
	
	
	
}
