package semi.project.jsnr.jibsa.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.Pagination;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.exception.JibsaException;
import semi.project.jsnr.jibsa.model.service.JibsaService;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.service.MemberService;
import semi.project.jsnr.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class JibsaController {
	@Autowired	//의존성 주입
	private JibsaService jService;
	@Autowired
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
	public String insertJibsa(@ModelAttribute Jibsa j,  
							@ModelAttribute JibsaProfile jp , HttpSession session,
							Model model, HttpServletRequest request,
							@RequestParam("file") MultipartFile file) {
		
		// session에서 멤버 넘버 가져오기
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memberName = ((Member)session.getAttribute("loginUser")).getMemberName();
		j.setMemberNo(memberNo);
		j.setMemberName(memberName);
		jp.setMemberNo(memberNo);
		jp.setJibsaName(memberName);
		System.out.println(jp);
		
		int result1 = jService.insertJibsa(j);
		int result2 = jService.insertJibsaProfile(jp);
		System.out.println(result2);
		Image image = null;
		
		if(file != null && !file.isEmpty()) {
			String[] returnArr = saveFile(file, request);
		
			if(returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setOriginalName(file.getOriginalFilename());
				image.setRenameName(returnArr[1]);
				image.setImageLevel(2);
				image.setMemberNo(memberNo);
				
				int insertImage = jService.insertImage(image);
				model.addAttribute("image", image);
			}
		} else {
			throw new JibsaException("사진 등록에 실패했습니다.");
		}
		
		if(result1>0 ) {
			return "enrollJibsaResult";
		} else {
			throw new JibsaException("정보 수정 실패했습니다.");
		}
	}
	
	@PostMapping("insertTrainer.js")
	public String insertTrainer(@ModelAttribute Jibsa j,  HttpSession session,
							Model model, HttpServletRequest request,
							@RequestParam("file") MultipartFile file) {
		
		// session에서 멤버 넘버 가져오기
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String memberName = ((Member)session.getAttribute("loginUser")).getMemberName();
		j.setMemberNo(memberNo);
		j.setMemberName(memberName);
		
		int result1 = jService.insertTrainer(j);
//		int result2 = jService.insertJibsaProfile(j);
		
		Image image = null;
		
		if(file != null && !file.isEmpty()) {
			String[] returnArr = saveFile(file, request);
		
			if(returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setOriginalName(file.getOriginalFilename());
				image.setRenameName(returnArr[1]);
				image.setImageLevel(2);
				image.setMemberNo(memberNo);
				
				int insertImageResult = jService.insertImage(image);
				model.addAttribute("image", image);
			}
		} else {
			throw new JibsaException("사진 등록에 실패했습니다.");
		}
		
		if(result1>0 ) {
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
	
	@RequestMapping("jibsa_Main.js")
	public String jibsa_Main(Model model,
							 HttpSession session) {
		Jibsa j = jService.selectJibsa(((Member)session.getAttribute("loginUser")).getMemberNo());
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", j.getMemberNo());
		map.put("type", 2);
		Image img = jService.selectImage(map);
		if(j != null) {
			model.addAttribute("img", img);
			model.addAttribute("j", j);
			return "jibsa_Main";
		}else {
			System.out.println("집사정보 로드 실패");
			return "";
		}
		
	}

	
	@GetMapping("jibsa_WorkTime.js")
	public String jibsa_WorkTime(HttpSession session,
			 					 Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		
		Jibsa j = jService.selectJibsa(m.getMemberNo());
		
		String[] jTime = j.getAvailableHour().split(",");
		String[] sArr = new String[7];
		String[] eArr = new String[7];
		for(int i = 0; i < 7; i++) {
			sArr[i] = jTime[i].substring(0, 2)
					 +":"+jTime[i].substring(2, 4);
		}
		for(int i = 0; i < 7; i++) {
			eArr[i] = jTime[i].substring(4, 6)
					+":"+jTime[i].substring(6, 8);
		}
		
		if(j != null) {
			model.addAttribute("j", j);
			model.addAttribute("sArr", sArr);
			model.addAttribute("eArr", eArr);
			return "jibsa_WorkTime";
		}else {
			System.out.println("집사workTime 불러오기 실패");
			return "";
		}
	}
	
	@PostMapping("jibsa_WorkTime_Update.js")
	public String jibsa_WorkTime_Update(@ModelAttribute Jibsa j) {
		
		int result = jService.updateJibsaAvailableHour(j);
		
		if(result > 0) {
			return "redirect:jibsa_Main.js";
		}else {
			System.out.println("집사 worktime 업데이트 에러");
			return "집사 worktime 업데이트 에러";
		}
		
	}
	
	@GetMapping("jibsa_Manage_Schedule.js")
	public String jibsa_Manage_Schedule(@RequestParam(value="page", required=false)Integer page,
										Model model,
										HttpSession session) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int listCount = jService.getMatchingCount(mNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> matchingList = jService.selectMatchingList(pi, mNo);
		
		if(matchingList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("matchingList", matchingList);
			return "jibsa_Manage_Schedule";
		}else {
			System.out.println("매칭정보 불러오기 에러");
			return "";
		}
	}
	
	@GetMapping("jibsa_Cancel_Matching.js")
	public String jibsa_Cancel_Matching(@RequestParam(value="page", required=false)Integer page,
										@RequestParam("mcNo")Integer mcNo,
										Model model) {
		int result = jService.cancelMatching(mcNo);
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:jibsa_Manage_Schedule.js";
		}else {
			System.out.println("매칭취소 실패");
			return "";
		}
	}
	
	// 집사 정보수정 - 현지
	@GetMapping("jibsaModifyInfo.js")
	public String jibsaModifyInfo(HttpSession session, @ModelAttribute Image i, Model model) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 집사 정보 세션에 담아서 뷰로 보내기
		Jibsa j = jService.selectJibsa(memberNo);
		
		session.setAttribute("jibsaInfo", j);	
		
		Image image = jService.selectImage2(memberNo);
		model.addAttribute("image", image);
		
		return "jibsa_Modify_Info";
	}
	
	@RequestMapping("premium_success.js")
	public String premiumSuccess(@RequestParam String date ,Model model, HttpSession session) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		Jibsa j = jService.selectJibsa(memberNo);
		session.setAttribute("jibsaInfo", j);	
		session.setAttribute("date", date);
		return "jibsa_Premium_Success";
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@GetMapping("jibsa_Modify_Schedule.js")
	public String jibsa_Modify_Schedule(@RequestParam(value="page", required=false) Integer page,
										@RequestParam("mcNo") String mcNo,
										Model model) {
		
		Board matching = jService.selectMatching(mcNo);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mNo", matching.getMemberNo());
		map.put("type", 1);
		Image image = jService.selectImage(map);
		
		if(matching != null) {
			model.addAttribute("page", page);
			model.addAttribute("image", image);
			model.addAttribute("mc", matching);
			return "jibsa_Modify_Schedule";
		}else {
			System.out.println("스케쥴 상세보기 실패");
			return "";
		}
		
	}
	
	@PostMapping("jibsa_Schedule_Update.js")
	public String jibsa_Schedule_Update(@RequestParam(value="page", required=false) Integer page,
										@ModelAttribute Matching mc,
										Model model) {
		
		System.out.println(mc);
		int result = jService.updateMatching(mc);
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:jibsa_Manage_Schedule.js";
		}else {
			System.out.println("집사-스케줄 변경 실패");
			return "";
		}
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
	public String premium(Model model) {
		int memberNo = ((Member)model.getAttribute("loginUser")).getMemberNo();
		Jibsa j = jService.selectJibsa(memberNo);
		model.addAttribute("jibsaInfo", j);
		return "jibsa_Premium";
	}
	
	@GetMapping("review.js")
	public String review() {
		return "jibsa_Review";
	}
	
	// 집사 정보수정 처리 - 현지
	@PostMapping("jibsaUpdateInfo.js")
	public String jibsaUpdateInfo(@ModelAttribute Jibsa j, @ModelAttribute Member m, Model model,
								  HttpSession session, HttpServletRequest request,
			  					  @RequestParam("file") MultipartFile file,
			  					  @RequestParam("deleteAttm") String[] deleteAttm) {
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
	        
	        
	        
	     // 사진 수정

			Image image = null;

			if (file != null && !file.isEmpty()) { // 새 파일이 들어왔을 때
				String[] returnArr = saveFile(file, request);
				// returnArr[0] : 저장된 파일의 경로 - returnArr[1] : 저장된 파일의 새로운 이름

				if (returnArr[1] != null) { // 새 파일 저장 성공
					image = new Image();
					image.setOriginalName(file.getOriginalFilename());
					image.setRenameName(returnArr[1]);
					image.setImagePath(returnArr[0]);
					image.setImageLevel(2);
					image.setMemberNo(j.getMemberNo());

					Image existingImage = jService.selectImage2(j.getMemberNo());
					if (existingImage == null) { // 기존 파일이 없을 때
						int insertImage = jService.insertImage(image);
						model.addAttribute("image", insertImage);
						System.out.println("삽입");

					} else { // 기존 파일이 있을 때
						System.out.println(j.getMemberNo());
						int deleteImage = jService.deleteImage(existingImage);
	    				System.out.println("삭제");
		            	
		            	String rename = existingImage.getRenameName();
		       			deleteFile(rename, request);
		            	System.out.println("파일 저장소 삭제");
		            	
		            	int insertImage = jService.insertImage(image);
			            model.addAttribute("image", insertImage);
			            System.out.println("삭제 후 삽입");
					}
				}
			}

			if (file.isEmpty()) { // 새 파일이 안 들어왔을 때
				Image existingImage = jService.selectImage2(j.getMemberNo());
				if (existingImage != null) { // 기존 파일이 있을 때 (삭제 버튼을 눌렀을 때)
					String delRename = "";
					Integer delLevel = 0;

					for (String rename : deleteAttm) { // deleteAttm에 담긴 rename과 level을 쪼개줌
						if (!rename.equals("none")) { // rename 값이 비워져있을 수도 있기 때문에
							String[] split = rename.split("/");
							delRename += split[0];
							delLevel += Integer.parseInt(split[1]);

							if (!delRename.isEmpty()) { // 삭제하려고 넘겨준 파일의 대한 rename이 존재할 때
								int deleteImage = jService.deleteImage(existingImage);
								System.out.println(deleteImage);
								System.out.println(existingImage);
								System.out.println("삭제");

								if (deleteImage > 0) { // 삭제된게 있는 상황에
									deleteFile(rename, request);
									System.out.println("파일 저장소 삭제");
								}
							}
						}
					}
				}
			}	
	        
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
	
	@RequestMapping("insertPremium.js")
	@ResponseBody
	public String insertPremium(@RequestParam("date") int date, @RequestParam("memberNo") int memberNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("date", date);
		map.put("memberNo", memberNo);
		
		int count = jService.insertPremium(map);
		
		String result = count == 1 ? "yes" : "no";
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
