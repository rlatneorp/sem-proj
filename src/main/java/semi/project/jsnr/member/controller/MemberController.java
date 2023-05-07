package semi.project.jsnr.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("myPage.me")
	public String myPage() {
		return "myPage";
	}
	
	
}
