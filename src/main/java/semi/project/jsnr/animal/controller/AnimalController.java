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
import semi.project.jsnr.animal.model.exception.ImageException;
import semi.project.jsnr.animal.model.service.AnimalService;
import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes({"animal", "image"})
@Controller
public class AnimalController {
	
	@Autowired
	private AnimalService aService;
	
	@ModelAttribute("animal")
    public Animal getAnimal() {
        return new Animal();

    }
	
	@ModelAttribute("image")
	public Image getImage() {
		return new Image();
	}
	
	@RequestMapping("member_User_Info.me") // 조회
	public String animalList(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser"); // 로그인한 유저 정보 얻기
		
		int memberNo = loginUser.getMemberNo(); // 로그인한 유저의 memberNo 가져오기
		
		Animal animal = aService.animalList(memberNo); // 해당 유저가 등록한 동물 정보 가져오기
		
		Image image = aService.selectImage(memberNo);
		
		model.addAttribute("animal", animal);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("image", image);

		return "member_User_Info";
	}
	
	@RequestMapping("member_Pet_Insert_Edit.me")
	public String member_Pet_Insert_Edit(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		Image image = aService.selectImage(memberNo);
		model.addAttribute("image", image);

		return "member_Pet_Insert_Edit";
	}
	
	@PostMapping("updateAnimal.me") // 수정
	public String updateAnimal(@ModelAttribute Animal a, @ModelAttribute Image i,
							   @RequestParam (value="dType") String dType,
							   @RequestParam (value="cType") String cType,
							   @RequestParam (value="oType") String oType,
							   Model model, HttpSession session,
		                       @RequestParam("file") MultipartFile file,
		                       @RequestParam("deleteAttm") String[] deleteAttm,
		                       HttpServletRequest request) {
		
		String animalType = dType + cType + oType;		
		a.setAnimalType(animalType);
		
		int result = aService.updateAnimal(a);
		
		Animal editAnimal = aService.animalList(a.getMemberNo());
		System.out.println("정보 수정");// 정보 수정
		
		// 사진 수정
		
		Image image = null;
		
		if(file != null && !file.isEmpty()) { // 새 파일이 들어왔을 때
			String[] returnArr = saveFile(file, request);
			// returnArr[0] : 저장된 파일의 경로 - returnArr[1] : 저장된 파일의 새로운 이름
			
			if(returnArr[1] != null) { // 새 파일 저장 성공
				image = new Image();
				image.setOriginalName(file.getOriginalFilename());
				image.setRenameName(returnArr[1]);
				image.setImagePath(returnArr[0]);
				image.setImageLevel(1);
				image.setMemberNo(a.getMemberNo());

	            Image existingImage = aService.selectImage(a.getMemberNo());
	            if (existingImage == null) { // 기존 파일이 없을 때
	                int insertImage = aService.insertImage(image);
	                model.addAttribute("image", insertImage);
	                System.out.println("삽입");
	                
	            } else { // 기존 파일이 있을 때
	            	int deleteImage = aService.deleteImage(existingImage);
    				System.out.println("삭제");
	            	
	            	String rename = existingImage.getRenameName();
	       			deleteFile(rename, request);
	            	System.out.println("파일 저장소 삭제");
	            	
	            	int insertImage = aService.insertImage(image);
		            model.addAttribute("image", insertImage);
		            System.out.println("삭제 후 삽입");
	            }	            				         	
	         }
	      }
	    		
		if(file.isEmpty()) { // 새 파일이 안 들어왔을 때
			Image existingImage = aService.selectImage(a.getMemberNo());
            if (existingImage != null) { // 기존 파일이 있을 때 (삭제 버튼을 눌렀을 때)
            	String delRename = "";
            	Integer delLevel = 0;

            	for(String rename : deleteAttm) { // deleteAttm에 담긴 rename과 level을 쪼개줌
            		if(!rename.equals("none")) { // rename 값이 비워져있을 수도 있기 때문에
            			String[] split = rename.split("/");
            			delRename += split[0];
            			delLevel += Integer.parseInt(split[1]);
            			
            			if(!delRename.isEmpty()) { // 삭제하려고 넘겨준 파일의 대한 rename이 존재할 때
            				int deleteImage = aService.deleteImage(existingImage);
        	                System.out.println(deleteImage);
        	                System.out.println(existingImage);
            				System.out.println("삭제");
            				
            				if(deleteImage > 0) { // 삭제된게 있는 상황에
            					deleteFile(rename, request);
            					System.out.println("파일 저장소 삭제");
            				}
            			}
            		}
            	}
            }
		}
		
		    if (result > 0) {
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
							   Model model, HttpSession session,
							   HttpServletRequest request,
							   @RequestParam("file") MultipartFile file) {

		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		String animalType = dType + cType + oType;
				
		a.setAnimalType(animalType);
		a.setMemberNo(memberNo);
		
		int result = aService.insertAnimal(a);
		
		Animal insertAnimal = aService.animalList(memberNo); // 정보 등록
		
		// 사진 등록
		
		Image image = null;
		
		if(file != null && !file.isEmpty()) {
			String[] returnArr = saveFile(file, request);
		
			if(returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setOriginalName(file.getOriginalFilename());
				image.setRenameName(returnArr[1]);
				image.setImageLevel(1);
				image.setMemberNo(memberNo);
				
				int insertImage = aService.insertImage(image);
				model.addAttribute("image", insertImage);
			}
		} else {
			System.out.println("사진을 등록하지 않았습니다.");
		}
				
		if(result > 0) {
			model.addAttribute("animal", insertAnimal);
			return "redirect:member_User_Info.me";
		} else {
			throw new AnimalException("동물 정보 등록에 실패하였습니다.");
		}	
	
	}
	
	@GetMapping("deleteAnimal.me") // 삭제
	public String deleteAnimal(@ModelAttribute Animal a, Model model) {
		
		Image image = aService.selectImage(a.getMemberNo());
		int deleteImage = aService.deleteImage(image);	
					
		int result = aService.deleteAnimal(a);
		 
		if(result > 0) {
			a.setIsStatus("N");
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
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
}


