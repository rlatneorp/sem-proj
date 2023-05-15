package semi.project.jsnr.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import semi.project.jsnr.matching.model.service.MatchingService;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mService;

	@GetMapping("matching_Main.mc")
	public String matching_Main() {
		return "matching_Main";
	}
}
