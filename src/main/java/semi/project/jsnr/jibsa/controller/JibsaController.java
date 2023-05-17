package semi.project.jsnr.jibsa.controller;

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

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.jibsa.model.exception.JibsaException;
import semi.project.jsnr.jibsa.model.service.JibsaService;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class JibsaController {
	@Autowired	//의존성 주입
	private JibsaService jService;
	private MemberService mService;
	
	
	
	@RequestMapping("enrollJibsa.js")
	public String enroll(@ModelAttribute Member m,
						Model model) {
		
			return "enrollJibsa";
	}
	
	@RequestMapping("enrollJibsaPage.js")
	public String enrollJibsaPage(@ModelAttribute Member m,
			Model model) {
		
		return "enrollJibsaPage";
	}
	
	@RequestMapping("enrollTrainerPage.js")
	public String enrollTrainerPage(@ModelAttribute Member m,
			Model model) {
		
		return "enrollTrainerPage";
	}
	
	@PostMapping("insertJibsa.js")
	public String insertJibsa(@ModelAttribute Jibsa j,  HttpSession session,
							Model model, HttpServletRequest request,
							@RequestParam("file") MultipartFile file) {
		
		// session에서 멤버 넘버 가져오기
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		j.setMemberNo(memberNo);
		
		int result = jService.insertJibsa(j);
		
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
			}
		}
		if(result>0) {
			return "enrollJibsaResult";
		} else {
			throw new JibsaException("정보 수정 실패했습니다.");
		}
	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장소 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles"; 
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
	
	@RequestMapping("jibsaMain.js")
	public String jibsaMain() {
		return "jibsa_Main";
	}
	
	@GetMapping("jibsaManagementSchedule.js")
	public String jibsaManagementSchedule() {
		return "jibsa_Management_Schedule";
	}
	
	// 집사 정보수정 - 현지
	@GetMapping("jibsaModifyInfo.js")
	public String jibsaModifyInfo(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 집사 정보 세션에 담아서 뷰로 보내기
		Jibsa j = jService.selectJibsa(memberNo);
		
		session.setAttribute("jibsaInfo", j);
		return "jibsa_Modify_Info";
	}
	
	@GetMapping("jibsaModifySchedule.js")
	public String jibsaModifySchedule() {
		return "jibsa_Modify_Schedule";
	}
	
	@GetMapping("jibsaWorkTime.js")
	public String jibsaWorkTime() {
		return "jibsa_Work_Time";
	}
	
	@GetMapping("QnA.js")
	public String QNA() {
		return "jibsa_QnA";
	}

	@GetMapping("FAQ.js")
	public String FAQ() {
		return "jibsa_FAQ";
	}
	
	@GetMapping("premium.js")
	public String premium() {
		return "jibsa_Premium";
	}
	
	@GetMapping("review.js")
	public String review() {
		return "jibsa_Review";
	}
	
	// 집사 정보수정 처리 - 현지
	@PostMapping("jibsaUpdateInfo.js")
	public String jibsaUpdateInfo(@ModelAttribute Jibsa j, @ModelAttribute Member m, Model model,
								  HttpSession session) {
		int result1 = jService.updateMemberInfo(m); // member부분 정보수정
		int result2 = jService.updateJibsaInfo(j);  // jibsa 부분 정보수정
		
		if(result1 > 0 && result2 > 0) {
			Member updatedMember = (Member) session.getAttribute("loginUser");
	        updatedMember.setMemberEmail(m.getMemberEmail());
	        updatedMember.setMemberPhone(m.getMemberPhone());
	        updatedMember.setMemberAddress(m.getMemberAddress());
	        // 수정한 내용 설정
	        
	        model.addAttribute("loginUser", updatedMember);
			// 정보 수정하면 값이 바로 바뀌게
			return "redirect:jibsaModifyInfo.js"; 
		} else {
			throw new JibsaException("정보 수정에 실패");
		}
	}
	
	// 집사 탈퇴 - 현지
	@GetMapping("jibsaDeleteInfo.me")
	public String jibsaDeleteInfo(@ModelAttribute Member m, HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int result = jService.deleteInfo(memberNo);
		
		if(result > 0) {
			m = (Member)session.getAttribute("loginUser");
			m.setIsJibsa("N"); // 수정한 값 설정
			session.setAttribute("loginUser", m);
			
			return "redirect:member_User_Info.me";
		} else {
			throw new JibsaException("집사 탈퇴 실패");
		}
	}
	
}
