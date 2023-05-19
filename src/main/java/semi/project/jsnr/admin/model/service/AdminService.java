package semi.project.jsnr.admin.model.service;

import java.util.ArrayList;

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

	public int getMemberCount() {
		return aDAO.getMemberCount(sqlSession);
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDAO.selectMemberList(sqlSession, pi);
	}

	public int getJibsaCount() {
		return aDAO.getJibsaCount(sqlSession);
	}
	
	public ArrayList<Jibsa> selectJibsaList(PageInfo pi) {
		return aDAO.selectJibsaList(sqlSession, pi);
	}

	public int getFaqCount() {
		return aDAO.getFaqCount(sqlSession);
	}

	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return aDAO.selectFaqList(sqlSession, pi);
	}

	public int getQnaCount() {
		return aDAO.getQnaCount(sqlSession);
	}

	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return aDAO.selectQnaList(sqlSession, pi);
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

	public Jibsa selectJibsa(int mId) {
		return aDAO.selectJibsa(sqlSession, mId);
	}

	public Image selectJibsaImage(int jNo) {
		return aDAO.selectJibsaImage(sqlSession, jNo);
	}
	
	public int updateJibsa(Jibsa j) {
		return aDAO.updateJibsa(sqlSession, j);
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

	public Qna selectQna(int qId) {
		return aDAO.selectQna(sqlSession, qId);
	}

	public int updateQna(Qna q) {
		return aDAO.updateQna(sqlSession, q);
	}

	public int selectApplyJibsa(int mId) {
		return aDAO.selectApplyJibsa(sqlSession, mId);
	}

	public int getReviewCount() {
		return aDAO.getReviewCount(sqlSession);
	}

	public ArrayList<Board> selectReviewList(PageInfo pi) {
		return aDAO.selectReviewList(sqlSession, pi);
	}

	public Board selectReview(int rId) {
		return aDAO.selectReview(sqlSession, rId);
	}

	public int updateReview(Board b) {
		return aDAO.updateReview(sqlSession, b);
	}

	public int updateMatching(Matching mc) {
		return aDAO.updateMatching(sqlSession, mc);
	}




	
}
