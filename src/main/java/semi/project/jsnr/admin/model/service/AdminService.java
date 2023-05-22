package semi.project.jsnr.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.admin.model.dao.AdminDAO;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;

//	멤버
	public int getMemberCount(HashMap<String, String> map) {
		return aDAO.getMemberCount(sqlSession, map);
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectMemberList(sqlSession, pi, map);
	}

	public Member selectMember(int mId) {
		return aDAO.selectMember(sqlSession, mId);
	}

	public int getAnimalCount(int mId) {
		return aDAO.getAnimalCount(sqlSession, mId);
	}

	public int updateMember(Member m) {
		return aDAO.updateMember(sqlSession, m);
	}
	
	public int deletesMember(ArrayList<String> selArr) {
		return aDAO.deletesMember(sqlSession, selArr);
	}

	public int activesMember(ArrayList<String> selArr) {
		return aDAO.activesMember(sqlSession, selArr);
	}

//	집사
	public int getJibsaCount(HashMap<String, String> map) {
		return aDAO.getJibsaCount(sqlSession, map);
	}
	
	public ArrayList<Jibsa> selectJibsaList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectJibsaList(sqlSession, pi, map);
	}

	public Jibsa selectJibsa(int mId) {
		return aDAO.selectJibsa(sqlSession, mId);
	}

	public Image selectJibsaImage(int jNo) {
		return aDAO.selectJibsaImage(sqlSession, jNo);
	}
	
	public int updateJibsa(Jibsa j) {
		return aDAO.updateJibsa(sqlSession, j);
	}

	public int deletesJibsa(ArrayList<String> selArr) {
		return aDAO.deletesJibsa(sqlSession, selArr);
	}

	public int activesJibsa(ArrayList<String> selArr) {
		return aDAO.activesJibsa(sqlSession, selArr);
	}
	
//	Faq
	public int getFaqCount(HashMap<String, String> map) {
		return aDAO.getFaqCount(sqlSession, map);
	}

	public ArrayList<Faq> selectFaqList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectFaqList(sqlSession, pi, map);
	}
	
	public Faq selectFaq(int fId) {
		return aDAO.selectFaq(sqlSession, fId);
	}

	public int updateFaq(Faq f) {
		return aDAO.updateFaq(sqlSession, f);
	}

	public int insertFaq(Faq f) {
		return aDAO.insertFaq(sqlSession, f);
	}

	public int deleteFaq(int fId) {
		return aDAO.deleteFaq(sqlSession, fId);
	}

	public int deletesFAQ(ArrayList<String> selArr) {
		return aDAO.deletesFAQ(sqlSession, selArr);
	}

	public int activesFAQ(ArrayList<String> selArr) {
		return aDAO.activesFAQ(sqlSession, selArr);
	}

//	Qna
	public int getQnaCount(HashMap<String, String> map) {
		return aDAO.getQnaCount(sqlSession, map);
	}

	public ArrayList<Qna> selectQnaList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectQnaList(sqlSession, pi, map);
	}

	public Qna selectQna(int qId) {
		return aDAO.selectQna(sqlSession, qId);
	}

	public int updateQna(Qna q) {
		return aDAO.updateQna(sqlSession, q);
	}

	public int selectApplyJibsa(int mId) {
		return aDAO.selectApplyJibsa(sqlSession, mId);
	}

	public int deletesQNA(ArrayList<String> selArr) {
		return aDAO.deletesQNA(sqlSession, selArr);
	}

	public int activesQNA(ArrayList<String> selArr) {
		return aDAO.activesQNA(sqlSession,selArr);
	}
//	리뷰
	public int getReviewCount(HashMap<String, String> map) {
		return aDAO.getReviewCount(sqlSession, map);
	}

	public ArrayList<Board> selectReviewList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectReviewList(sqlSession, pi, map);
	}

	public Board selectReview(int rId) {
		return aDAO.selectReview(sqlSession, rId);
	}

	public int updateReview(Board b) {
		return aDAO.updateReview(sqlSession, b);
	}

	public int deletesReview(ArrayList<String> selArr) {
		return aDAO.deletesReview(sqlSession, selArr);
	}

	public int activesReview(ArrayList<String> selArr) {
		return aDAO.activesReview(sqlSession, selArr);
	}
	
//	매칭
	public int updateMatching(Matching mc) {
		return aDAO.updateMatching(sqlSession, mc);
	}

	public int deletesMatching(ArrayList<String> selArr) {
		return aDAO.deletesMatching(sqlSession, selArr);
	}

	public int activesMatching(ArrayList<String> selArr) {
		return aDAO.activesMatching(sqlSession, selArr);
	}





	
}
