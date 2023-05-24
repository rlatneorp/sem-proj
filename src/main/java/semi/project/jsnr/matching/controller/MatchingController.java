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
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
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
		Member m = (Member)(session.getAttribute("loginUser"));
		
		if(m != null){
			int mNo = m.getMemberNo();
			ArrayList<Animal> aList = mcService.selectAnimalList(mNo);
			m.setAnimalCount(aList.size());
			
			if(aList != null) {
				model.addAttribute("aList", aList);
				return "matching_Main";
			}else {
				System.out.println("aList 호출 에러");
				return "";
			}
		}else {
			return "matching_Main";
		}
	}
	
	@RequestMapping("matching_Result.mc")
	public String matching_Result(@ModelAttribute Matching mc,
								  Model model,
								  HttpSession session) {
		
		ArrayList<JibsaProfile> orgJpList = mcService.selectMatchingResult(mc);
		if(orgJpList != null) {
			
			for(JibsaProfile j: orgJpList) {
				String[] arr = new String[7];
				for(int i = 0; i < 7; i++) {
					arr[i] = j.getAvailableHour().split(",")[i];
				}
				j.setAvailableHourArr(arr);
			}
			
//			시간 비교하기 / 리턴리스트에 넣기
			ArrayList<JibsaProfile> jpList = new ArrayList<JibsaProfile>();
			
//			이용자가 입력한 값 변수에 Integer타입으로 초기화
			int startTime = Integer.parseInt(mc.getStartDate().substring(11));
			int startDay = Integer.parseInt(mc.getStartDate().substring(10,11));
			int endTime = Integer.parseInt(mc.getEndDate().substring(11));
			int endDay = Integer.parseInt(mc.getEndDate().substring(10,11));
			
			for(JibsaProfile j: orgJpList) {
				if(j.getMemberNo() == ((Member)session.getAttribute("loginUser")).getMemberNo()) {
//					나-나 매칭 제외
				}else {
					int jStartTime = 0;
					if(!j.getAvailableHourArr()[startDay].equals("00000000")) {
//															┌ String -> Double			┌ int -> String				 ┌뒤의 4자리를 버리기 위함
						jStartTime = (int)Math.floor(  Double.parseDouble(j.getAvailableHourArr()[startDay]  )*0.0001  );
					}
					int jEndTime = 0;
					if(jStartTime <= startTime) {
						
						int endD = Integer.parseInt(j.getAvailableHourArr()[endDay]);
						
//						ex) 00000000 ->    0		-> 0
						if(endD == 0) {
							jEndTime = 0;
							
//						ex) 00002000 -> 2000		-> 2000
						}else if(endD < 10000 ) {
							jEndTime = Integer.parseInt((j.getAvailableHourArr()[endDay]));
							
//						ex) 10002000 -> 10002000	-> 2000
						}else{
							jEndTime = Integer.parseInt((j.getAvailableHourArr()[endDay]).substring(4, 8));
						}
						
						if(jEndTime >= endTime) {
							jpList.add(j);
						}
					}
				}
			}
			
			ArrayList<Jibsa> jList = new ArrayList<Jibsa>();
			
			for(int i = 0; i < jpList.size(); i++) {
				Jibsa j = mcService.selectJibsa(jpList.get(i).getMemberNo());
				if(j.getIsPrimium().equals("Y")) {
					jList.add(j);
				}
			}
			for(int i = 0; i < jpList.size(); i++) {
				Jibsa j = mcService.selectJibsa(jpList.get(i).getMemberNo());
				if(j.getIsPrimium().equals("N")) {
					jList.add(j);
				}
			}
			
			ArrayList<Image> iList = new ArrayList<Image>();
			for(int i = 0; i < jpList.size(); i++) {
				Image image = mcService.imageList(jpList.get(i).getMemberNo());
				iList.add(image);
			}
			
			model.addAttribute("mc", mc);
			model.addAttribute("jList", jList);
			model.addAttribute("jpList", jpList);
			model.addAttribute("iList", iList);
			
			System.out.println(jpList);
			System.out.println(iList);
			return "matching_Result";
		}else {
			System.out.println("매칭결과 에러");
			return "";
		}
	}
	
	@RequestMapping("matching_Success.mc")
	public String matching_Success(@RequestParam("jNo") int jNo,
								   HttpSession session,
								   Model model) {
		System.out.println(jNo);
		Matching mc = (Matching)session.getAttribute("mc");
		
		Member m = (Member)session.getAttribute("loginUser");
		
		mc.setMemberNo(m.getMemberNo());
		mc.setJibsaNo(jNo);
		
		int result = mcService.insertMatching(mc);
		Jibsa j = mcService.selectJibsa(jNo);
		Animal a = mcService.selectAnimal(mc.getAnimalNo());
		
		if(result > 0 && j != null) {
			session.removeAttribute("mc");
			model.addAttribute("mc", mc);
			model.addAttribute("j", j);
			model.addAttribute("a", a);
			return "matching_Success";
		}else {
			System.out.println("매칭 에러");
			return "";
		}
	}
}
