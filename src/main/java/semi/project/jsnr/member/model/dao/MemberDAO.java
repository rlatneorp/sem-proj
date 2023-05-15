package semi.project.jsnr.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.member.model.vo.Member;

@Repository
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public ArrayList<Faq> getMemberFaqList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.getMemberFaqList");
	}

	public int getMemberQnaListCount(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("memberMapper.getMemberQnaListCount", mId);
	}

	public ArrayList<Qna> getMemberQnaList(SqlSessionTemplate sqlSession, int mId) {
		return (ArrayList)sqlSession.selectList("memberMapper.getMemberQnaList", mId);
	}

	public Qna getQnaSelect(SqlSessionTemplate sqlSession, int qId) {
		return sqlSession.selectOne("memberMapper.getQnaSelect", qId);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("memberMapper.updateQna", q);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qId) {
		return sqlSession.update("memberMapper.deleteQna", qId);
	}

	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("memberMapper.insertQna", q);
	}

	public int checkMemberId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checkMemberId", memberId);
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateInfo", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}

	public int deleteInfo(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteInfo", memberId);
	}

}
