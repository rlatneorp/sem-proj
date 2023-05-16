package semi.project.jsnr.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import semi.project.jsnr.matching.service.MatchingService;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService maService;

	@RequestMapping("matching_Main.mc")
	public String matching_Main() {
		return "matching_Main";
	}
	
	@RequestMapping("matching_Result.mc")
	public String matching_Result() {
		return "matching_Result";
	}
	
	@RequestMapping("matching_Success.mc")
	public String matching_Success() {
		return "matching_Success";
	}
}
