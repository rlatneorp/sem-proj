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
	public String enroll(Member m) {
		return "enrolljibsa";
	}
	
	@PostMapping("updateJibsa.me")
	public String editMyInfo(@ModelAttribute Member m, 
							Model model) {
		
		int result = jService.updateJibsa(m);
		
		if(result>0) {
			Member updateJibsa = mService.login(m);
			model.addAttribute("loginUser",updateJibsa);
			return " ";
		} else {
			throw new JibsaException("정보 수정 실패했습니다.");
		}
	}
	
	
	
	@RequestMapping("jibsaMain.js")
	public String jibsaMain() {
		return "jibsaMain";
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
	
	@GetMapping("secession.js")
	public String secession() {
		return "secession";
	}
	
//	임시 연결
	@GetMapping("jibsaList.js")
	public String jibsaList() {
		return "jibsaList";
	}
	
	
	
	
	
	
}
