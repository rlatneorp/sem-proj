package semi.project.jsnr.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.admin.model.dao.AdminDAO;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
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


	
}
