package semi.project.jsnr.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.member.model.vo.Member;

@Repository
public class AdminDAO {

	public int getMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberCount");
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", pi, rowBounds);
	}

	public int getJibsaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getJibsaCount");
	}

	public ArrayList<Jibsa> selectJibsaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectJibsaList", pi, rowBounds);
	}

	public int getFaqCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getFaqCount");
	}

	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectFaqList", pi, rowBounds);
	}

	public int getQnaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getQnaCount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectQnaList", pi, rowBounds);
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
	
	public Jibsa selectJibsa(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("adminMapper.selectJibsa", mId);
	}

	public int updateJibsa(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.update("adminMapper.updateJibsa", j);
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

	public Qna selectQna(SqlSessionTemplate sqlSession, int qId) {
		return sqlSession.selectOne("adminMapper.selectQna", qId);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("adminMapper.updateQna", q);
	}



}
