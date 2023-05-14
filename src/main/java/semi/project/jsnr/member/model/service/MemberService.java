package semi.project.jsnr.member.model.service;

import java.util.ArrayList;import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
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
}
