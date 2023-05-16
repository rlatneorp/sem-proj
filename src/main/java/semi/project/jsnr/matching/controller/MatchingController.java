package semi.project.jsnr.matching.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.service.MatchingService;
import semi.project.jsnr.matching.model.vo.Matching;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mcService;

	@RequestMapping("matching_Main.mc")
	public String matching_Main() {
		return "matching_Main";
	}
	
	@RequestMapping("matching_Result.mc")
	public String matching_Result(@ModelAttribute Matching mc,
								  @RequestParam("startDay") String sD,
								  @RequestParam("startTime") String sT,
								  @RequestParam("endDay") String eD,
								  @RequestParam("endTime") String eT,
								  Model model) {
		mc.setStartDate(sD+"_"+sT);
		mc.setEndDate(eD+"_"+eT);
		
		ArrayList<JibsaProfile> jpList = mcService.selectMatchingResult(mc);
		System.out.println(jpList);
		if(jpList != null) {
			model.addAttribute("jpList", jpList);
			return "matching_Result";
		}else {
			System.out.println("매칭결과 에러");
			return "";
		}
	}
	
	@RequestMapping("matching_Success.mc")
	public String matching_Success() {
		return "matching_Success";
	}
}
