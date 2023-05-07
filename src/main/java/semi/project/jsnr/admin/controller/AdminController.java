package semi.project.jsnr.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("adminMain.ad")
	public String adminMain() {
		return "adminMain";
	}
	
	@GetMapping("adminModifyJibsa.ad")
	public String adminModifyJibsa() {
		return "adminModifyJibsa";
	}
	
	@GetMapping("adminModifyMember.ad")
	public String adminModifyMember() {
		return "adminModifyMember";
	}
	
	@GetMapping("adminModifySchedule.ad")
	public String adminModifySchedule() {
		return "adminModifySchedule";
	}
	
	@GetMapping("adminQuestionList.ad")
	public String adminQuestionList() {
		return "p_main";
	}
}
