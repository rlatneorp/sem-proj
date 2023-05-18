package semi.project.jsnr.matching.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.service.MatchingService;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mcService;

	@RequestMapping("matching_Main.mc")
	public String matching_Main(HttpSession session,
								Model model) {
		int mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Animal> aList = mcService.selectAnimalList(mNo);
		
		if(aList != null) {
			model.addAttribute("aList", aList);
			return "matching_Main";
		}else {
			System.out.println("매칭 메인 에러");
			return "";
		}
	}
	
	@RequestMapping("matching_Result.mc")
	public String matching_Result(@ModelAttribute Matching mc,
								  Model model,
								  HttpSession session) {
		
		ArrayList<JibsaProfile> orgJpList = mcService.selectMatchingResult(mc);
//		System.out.println(orgJpList);
		if(orgJpList != null) {
			
		
			for(JibsaProfile j: orgJpList) {
				String[] arr = new String[7];
				for(int i = 0; i < 7; i++) {
					arr[i] = j.getAvailableHour().split(",")[i];
				}
				j.setAvailableHourArr(arr);
			}
			
	//		시간 비교하기 / 리턴리스트에 넣기
			ArrayList<JibsaProfile> jpList = new ArrayList<JibsaProfile>();
			
			int startTime = Integer.parseInt(mc.getStartDate().substring(11));
			int startDay = Integer.parseInt(mc.getStartDate().substring(10,11));
			int endTime = Integer.parseInt(mc.getEndDate().substring(11));
			int endDay = Integer.parseInt(mc.getEndDate().substring(10,11));
			
			
			for(JibsaProfile j: orgJpList) {
	//													┌ String -> Double			┌ int -> String				 ┌뒤의 4자리를 버리기 위함
				int jStartTime =  (int)Math.floor(  Double.parseDouble(j.getAvailableHourArr()[startDay]  )*0.0001  );
				int jEndTime = 0;
				if(jStartTime <= startTime) {
					
					int endD = Integer.parseInt(j.getAvailableHourArr()[endDay]);
					
					if(endD == 0) {
						jEndTime = 0;
					}else if(endD < 10000 ) {
						jEndTime = Integer.parseInt((j.getAvailableHourArr()[endDay]+"").substring(0, 4));
					}else{
						jEndTime = Integer.parseInt((j.getAvailableHourArr()[endDay]+"").substring(4, 8));
					}
					
					if(jEndTime >= endTime) {
					System.out.println("합격!"+j.getJibsaName());
					jpList.add(j);
					}
				}
			}
//			session.setAttribute("mc", mc);
			model.addAttribute("mc", mc);
			model.addAttribute("jpList", jpList);
			return "matching_Result";
		}else {
			System.out.println("매칭결과 에러");
			return "";
		}
	}
	
	@RequestMapping("matching_Success.mc")
	public String matching_Success(@RequestParam("jNo") int jNo,
								   HttpSession session) {

		Matching mc = (Matching)session.getAttribute("mc");
		
		Member m = (Member)session.getAttribute("loginUser");
		
		mc.setMemberNo(m.getMemberNo());
		mc.setJibsaNo(jNo);
		
		int result = mcService.insertMatching(mc);
		if(result > 0) {
			session.removeAttribute("mc");
			return "matching_Success";
		}else {
			System.out.println("매칭 에러");
			return "";
		}
	}
}
