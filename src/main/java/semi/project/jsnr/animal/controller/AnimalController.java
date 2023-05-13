package semi.project.jsnr.animal.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import semi.project.jsnr.animal.model.exception.AnimalException;
import semi.project.jsnr.animal.model.service.AnimalService;
import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.member.model.vo.Member;

@Controller
public class AnimalController {
	
	@Autowired
	private AnimalService aService;
	
	@RequestMapping("member_User_Info.me")
	public String user_Info(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser"); // 로그인한 유저 정보 얻기
		
		int memberNo = loginUser.getMemberNo(); // 로그인한 유저의 memberNo 가져오기
		
		ArrayList<Animal> list = aService.AnimalList(memberNo); // 해당 유저가 등록한 동물 정보 가져오기
		
		Animal animal = list.get(memberNo);
		
		System.out.println(animal);

		return "member_User_Info";
	}
	
	@RequestMapping("pet_Insert.me")
	public String pet_Insert() {
		return "pet_Insert";
	}
	
	@PostMapping("insertAnimal.me")
	public String insertAnimal(@ModelAttribute Animal a) {
		int result = aService.insertAnimal(a);
		
		if(result > 0) {
			return "redirect:user_Info";
		} else {
			throw new AnimalException("동물 등록 실패");
		}	
		
	}
	

}
