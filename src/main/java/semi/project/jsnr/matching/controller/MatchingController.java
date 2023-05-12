package semi.project.jsnr.matching.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchingController {

	@GetMapping("matching_Main.mc")
	public String matching_Main() {
		return "matching_Main";
	}
}
