package semi.project.jsnr.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Repository
public class AdminDAO {

	public int getMemberCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getMemberCount", map);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", map, rowBounds);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("adminMapper.selectMember", mId);
	}

	public int getAnimalCount(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("adminMapper.getAnimalCount", mId);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.updateMember", m);
	}

	public int deletesMember(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesMember", selArr);
	}

	public int activesMember(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesMember", selArr);
	}

	
	
	
//	집사
	public int getJibsaCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getJibsaCount", map);
	}

	public ArrayList<Jibsa> selectJibsaList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectJibsaList", map, rowBounds);
	}

	public Jibsa selectJibsa(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("adminMapper.selectJibsa", mId);
	}

	public Image selectJibsaImage(SqlSessionTemplate sqlSession, int jNo) {
		return sqlSession.selectOne("adminMapper.selectJibsaImage", jNo);
	}

	public int updateJibsa(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.update("adminMapper.updateJibsa", j);
	}
	
	public int deletesJibsa(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesJibsa", selArr);
	}

	public int activesJibsa(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesJibsa", selArr);
	}

	
//	FAQ
	public int getFaqCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getFaqCount", map);
	}

	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectFaqList", map, rowBounds);
	}

	public Faq selectFaq(SqlSessionTemplate sqlSession, int fId) {
		return sqlSession.selectOne("adminMapper.selectFaq", fId);
	}

	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.update("adminMapper.updateFaq", f);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("adminMapper.insertFaq", f);
	}

	public int deleteFaq(SqlSessionTemplate sqlSession, int fId) {
		return sqlSession.delete("adminMapper.deleteFaq", fId);
	}
	
	public int deletesFAQ(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesFAQ", selArr);
	}

	public int activesFAQ(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesFAQ", selArr);
	}

	
//	QNA
	public int getQnaCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getQnaCount", map);
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectQnaList", map, rowBounds);
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qId) {
		return sqlSession.selectOne("adminMapper.selectQna", qId);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("adminMapper.updateQna", q);
	}

	public int selectApplyJibsa(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("adminMapper.selectApplyJibsa", mId);
	}

	public int deletesQNA(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesQNA", selArr);
	}

	public int activesQNA(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesQNA", selArr);
	}
	
//	리뷰
	public int getReviewCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getReviewCount", map);
	}

	public ArrayList<Board> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList", map, rowBounds);
	}

	public Board selectReview(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.selectOne("adminMapper.selectReview", rId);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("adminMapper.updateReview", b);
	}
	
	public int deletesReview(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesReview", selArr);
	}

	public int activesReview(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesReview", selArr);
	}


//	매칭
	public int updateMatching(SqlSessionTemplate sqlSession, Matching mc) {
		return sqlSession.update("adminMapper.updateMatching", mc);
	}
	
	public int deletesMatching(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.deletesMatching", selArr);
	}

	public int activesMatching(SqlSessionTemplate sqlSession, ArrayList<String> selArr) {
		return sqlSession.update("adminMapper.activesMatching", selArr);
	}



}
