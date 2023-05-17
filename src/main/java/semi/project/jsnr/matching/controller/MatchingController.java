package semi.project.jsnr.matching.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.service.MatchingService;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mcService;

	@RequestMapping("matching_Main.mc")
	public String matching_Main(HttpSession session) {
		System.out.println(session.getAttribute("mcc"));
		return "matching_Main";
	}
	
	@RequestMapping("matching_Result.mc")
	public String matching_Result(@ModelAttribute Matching mc,
								  Model model,
								  HttpSession session) {
		
		System.out.println(mc);
		
		ArrayList<JibsaProfile> orgJpList = mcService.selectMatchingResult(mc);
//		System.out.println(orgJpList);
		if(orgJpList != null) {
			
		
			for(JibsaProfile j: orgJpList) {
				int[] arr = new int[7];
				for(int i = 0; i < 7; i++) {
					arr[i] = Integer.parseInt(j.getAvailableHour().split(",")[i]);
				}
				j.setAvailableHourArr(arr);
			}
			
	//		시간 비교하기 / 리턴리스트에 넣기
			ArrayList<JibsaProfile> jpList = new ArrayList<JibsaProfile>();
			
			int startTime = Integer.parseInt(mc.getStartDate().substring(11));
			int startDay = Integer.parseInt(mc.getStartDate().substring(10,11));
			int endTime = Integer.parseInt(mc.getEndDate().substring(11));
			int endDay = Integer.parseInt(mc.getEndDate().substring(10,11));
			
	//		int jStartTime =  (int)Math.floor(  Double.parseDouble(  jpList.get(0).getAvailableHourArr()[startDay]+""  )*0.0001  );
			
			for(JibsaProfile j: orgJpList) {
	//													┌ String -> Double			┌ int -> String				 ┌뒤의 4자리를 버리기 위함
				int jStartTime =  (int)Math.floor(  Double.parseDouble(j.getAvailableHourArr()[startDay]+""  )*0.0001  );
				int jEndTime = 0;
				if(jStartTime <= startTime) {
	//													┌ String -> Double			┌ int -> String				 ┌뒤의 4자리를 버리기 위함
//					int jEndTime =  (int)Math.floor(  Double.parseDouble(j.getAvailableHourArr()[endDay]+""  )*0.0001  );
					
					int endD = j.getAvailableHourArr()[endDay];
					
					if(endD == 0) {
						jEndTime = 0;
					}else if(endD < 10000 ) {
						jEndTime = Integer.parseInt((j.getAvailableHourArr()[endDay]+"").substring(0, 4)); 
					}else {
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
		
//		멤버에 동물 등록, 매칭장소 등록을 통해 page에서 입력(선택)받아 아래의 데이터 대신 넣어줘야함.
		mc.setAnimalNo(1);
		mc.setMatchingPlace("성북동 10101-10");
		
		int result = mcService.insertMatching(mc);
		session.removeAttribute("mc");
		return "matching_Success";
	}
}
