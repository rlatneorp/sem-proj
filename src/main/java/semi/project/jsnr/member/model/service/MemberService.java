package semi.project.jsnr.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.member.model.dao.MemberDAO;
import semi.project.jsnr.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	public ArrayList<Faq> getMemberFaqList() {
		return mDAO.getMemberFaqList(sqlSession);
	}

	public int getMemberQnaListCount(int mId) {
		return mDAO.getMemberQnaListCount(sqlSession, mId);
	}

	public ArrayList<Qna> getMemberQnaList(int mId) {
		return mDAO.getMemberQnaList(sqlSession, mId);
	}

	public Qna getQnaSelect(int qId) {
		return mDAO.getQnaSelect(sqlSession, qId);
	}

	public int updateQna(Qna q) {
		return mDAO.updateQna(sqlSession, q);
	}

	public int deleteQna(int qId) {
		return mDAO.deleteQna(sqlSession, qId);
	}

	public int insertQna(Qna q) {
		return mDAO.insertQna(sqlSession, q);
	}

	public int checkMemberId(String memberId) {
		return mDAO.checkMemberId(sqlSession, memberId);
	}

	public int updateInfo(Member m) {
		return mDAO.updateInfo(sqlSession, m);
	}

	public int updatePwd(HashMap<String, String> map) {
		return mDAO.updatePwd(sqlSession, map);
	}

	public int deleteInfo(String memberId) {
		return mDAO.deleteInfo(sqlSession, memberId);
	}

	public String foundId(Member m) {
		return mDAO.foundId(sqlSession, m);
	}

	public int enrollMember(Member m) {
		return mDAO.enrollMember(sqlSession, m);
	}

	public Member selectMember(String memberEmail) {
		return mDAO.seletMember(sqlSession, memberEmail);
	}

	public int updateNewPwd(HashMap<String, String> map) {
		return mDAO.updateNewPwd(sqlSession, map);
	}

	public int checkInfo(HashMap<String, String> map) {
		return mDAO.checkInfo(sqlSession, map);
	}
	
	public int foundCheckId(HashMap<String, String> map) {
		return mDAO.foundCheckId(sqlSession, map);
	}

	public int reservationListCount(int memberNo) {
		return mDAO.reservationListCount(sqlSession, memberNo);
	}

	public ArrayList<Board> selectReserList(int memberNo, PageInfo pi) {
		return mDAO.selectReserList(sqlSession, memberNo, pi);
	}

	public ArrayList<Board> selectReserList(int memberNo) {
		return mDAO.selectReserList(sqlSession, memberNo);
	}

	public int cancelMatching(int matchingNo) {
		return mDAO.cancelMatching(sqlSession, matchingNo);
	}

	public int insertReview(Board b) {
		return mDAO.insertReview(sqlSession, b);
	}

	public int updateReview(Board b) {
		return mDAO.updateReview(sqlSession, b);
	}

	public int deleteReview(Board b) {
		return mDAO.deleteReview(sqlSession, b);
	}
	
	public Animal selectAnimal(int mNo) {
		return mDAO.selectAnimal(sqlSession, mNo);
	}

}
