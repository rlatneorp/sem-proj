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
		
//		SQL문으로 1차 조건을 제외한 첫번째 (집사프로필)리스트
		ArrayList<JibsaProfile> jpListOne = mcService.selectMatchingResult(mc);
		
		if(jpListOne != null) {
			
			for(JibsaProfile j: jpListOne) {
				String[] arr = new String[7];
				for(int i = 0; i < 7; i++) {
					arr[i] = j.getAvailableHour().split(",")[i];
				}
				j.setAvailableHourArr(arr);
			}
			
//			시간 비교의 결과물이 될 두번째 (집사프로필)리스트
			ArrayList<JibsaProfile> jpListTwo = new ArrayList<JibsaProfile>();
			
//			이용자가 입력한 값 변수에 Integer타입으로 초기화
			int mStartTime = Integer.parseInt(mc.getStartDate().substring(11));
			int mStartDay = Integer.parseInt(mc.getStartDate().substring(10,11));
			int mEndTime = Integer.parseInt(mc.getEndDate().substring(11));
			int mEndDay = Integer.parseInt(mc.getEndDate().substring(10,11));
			
			for(JibsaProfile j: jpListOne) {
				if(j.getMemberNo() == ((Member)session.getAttribute("loginUser")).getMemberNo()) {
//					나-나 매칭 제외
				}else {
					int jStartTime = 0;
					if(!j.getAvailableHourArr()[mStartDay].equals("00000000")) {
						jStartTime = Integer.parseInt((j.getAvailableHourArr()[mStartDay]).substring(0, 4));
					}
					int jEndTime = 0;
					if(jStartTime <= mStartTime) {
						jEndTime = Integer.parseInt((j.getAvailableHourArr()[mEndDay]).substring(4, 8));
						if(jEndTime >= mEndTime) {
							jpListTwo.add(j);
						}
					}
				}
			}
//			프리미엄 가입자 상단에 올리기		/		집사, 집사 프로필 리스트 순서에 맞춰 다시 담기
			ArrayList<Jibsa> jList = new ArrayList<Jibsa>();
			ArrayList<JibsaProfile> jpList = new ArrayList<JibsaProfile>();
			for(int i = 0; i < jpListTwo.size(); i++) {
				Jibsa j = mcService.selectJibsa(jpListTwo.get(i).getMemberNo());
				if(j.getIsPrimium().equals("Y")) {
					jpList.add(jpListTwo.get(i));
					jList.add(j);
				}
			}
			for(int i = 0; i < jpListTwo.size(); i++) {
				Jibsa j = mcService.selectJibsa(jpListTwo.get(i).getMemberNo());
				if(j.getIsPrimium().equals("N")) {
					jpList.add(jpListTwo.get(i));
					jList.add(j);
				}
			}
			
//			집사 이미지 불러오기
			ArrayList<Image> iList = new ArrayList<Image>();
			for(int i = 0; i < jpListTwo.size(); i++) {
				Image image = mcService.imageList(jpListTwo.get(i).getMemberNo());
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
