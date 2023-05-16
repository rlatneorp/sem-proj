package semi.project.jsnr.animal.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import semi.project.jsnr.animal.model.exception.AnimalException;
import semi.project.jsnr.animal.model.service.AnimalService;
import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("animal")
@Controller
public class AnimalController {
	
	@Autowired
	private AnimalService aService;
	
	@ModelAttribute("animal")
    public Animal getAnimal() {
        return new Animal();

    }
	
	@RequestMapping("member_User_Info.me") // 조회
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
	
	@PostMapping("updateAnimal.me") // 수정
	public String updateAnimal(@ModelAttribute Animal a,
							   @RequestParam (value="dType") String dType,
							   @RequestParam (value="cType") String cType,
							   @RequestParam (value="oType") String oType,
							   Model model, HttpSession session) {
		
		String animalType = dType + cType + oType;
		
		a.setAnimalType(animalType);
		
		int result = aService.updateAnimal(a);
		
		Animal editAnimal = aService.animalList(a.getMemberNo());
		
		System.out.println(editAnimal);
		
		if(result > 0) {
			model.addAttribute("animal", editAnimal);
			return "redirect:member_User_Info.me";
		} else {
			throw new AnimalException("동물 정보 수정에 실패하였습니다.");
		}		
	}
	
	@RequestMapping("member_Pet_Insert.me")
	public String member_Pet_Insert() {

		return "member_Pet_Insert";
	}
	
	@PostMapping("insertAnimal.me") // 등록
	public String insertAnimal(@ModelAttribute Animal a,
							   @RequestParam (value="dType") String dType,
							   @RequestParam (value="cType") String cType,
							   @RequestParam (value="oType") String oType,
							   Model model, HttpSession session) {

		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		String animalType = dType + cType + oType;
		a.setAnimalType(animalType);
		a.setMemberNo(memberNo);
		
		int result = aService.insertAnimal(a);
		
		Animal insertAnimal = aService.animalList(memberNo);
		
		System.out.println(animalType);
		System.out.println(a);
		System.out.println(result);
		System.out.println(insertAnimal);
		
		if(result > 0) {
			model.addAttribute("animal", insertAnimal);
			return "redirect:member_User_Info.me";
		} else {
			throw new AnimalException("동물 정보 등록에 실패하였습니다.");
		}		
	}
	
	@GetMapping("deleteAnimal.me") // 삭제
	public String deleteAnimal(@ModelAttribute Animal a) {
		
		int result = aService.deleteAnimal(a);
		
		if(result > 0) {
			return "redirect:member_User_Info.me";
		} else {
			throw new AnimalException("동물 정보 삭제에 실패하였습니다.");
		}		
	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장소 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles"; // 역슬래시 두개로 \ 하나를 나타내도록 함
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// 변경된 이름의 파일을 저장
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}
}


