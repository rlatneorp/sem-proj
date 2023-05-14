package semi.project.jsnr.animal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import semi.project.jsnr.animal.model.exception.AnimalException;
import semi.project.jsnr.animal.model.service.AnimalService;
import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("animal")
@Controller
public class AnimalController {
	
	@Autowired
	private AnimalService aService;
	
	@RequestMapping("member_User_Info.me")
	public String animalList(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser"); // 로그인한 유저 정보 얻기
		
		int memberNo = loginUser.getMemberNo(); // 로그인한 유저의 memberNo 가져오기
		
		Animal animal = aService.animalList(memberNo); // 해당 유저가 등록한 동물 정보 가져오기
		model.addAttribute("animal", animal);
		model.addAttribute("loginUser", loginUser);

		return "member_User_Info";
	}
	
	@RequestMapping("member_Pet_Insert_Edit.me")
	public String member_Pet_Insert_Edit() {

		return "member_Pet_Insert_Edit";
	}
	
	@PostMapping("updateAnimal.me")
	public String updateAnimal(@ModelAttribute Animal a, Model model, HttpSession session) {
		System.out.println(a);
		
		int result = aService.updateAnimal(a);
		
		System.out.println(a);
		System.out.println(result);
		
		if(result > 0) {
			model.addAttribute("animal", aService.animalEditList(a));
			return "redirect:member_User_Info.me";
		} else {
			throw new AnimalException("동물 정보 수정에 실패하였습니다.");
		}
		
	}
		
	}
	


