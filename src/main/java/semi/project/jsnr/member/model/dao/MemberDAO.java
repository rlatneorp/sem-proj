package semi.project.jsnr.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
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

	public String foundId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.foundId", m);
	}

	public int enrollMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.enrollMember", m);
	}

	public Member seletMember(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("memberMapper.selectMember", memberEmail);
	}

	public int updateNewPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updateNewPwd", map);
	}

	public int checkInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.checkInfo", map);
	}
	
	public int foundCheckId(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.foundCheckId", map);
	}

	public int reservationListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.reservationListCount", memberNo);
	}

	public ArrayList<Board> selectReserList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectReserList", memberNo, rowBounds);
	}

	public ArrayList<Board> selectReserList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectReser", memberNo);
	}

	public int cancelMatching(SqlSessionTemplate sqlSession, int matchingNo) {
		return sqlSession.update("memberMapper.cancelMatching", matchingNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("memberMapper.insertReview", b);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("memberMapper.updateReview", b);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("memberMapper.deleteReview", b);
	}
	
	public Animal selectAnimal(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("memberMapper.selectAnimal", mNo);
	}

	public Image selectAnimalImage(SqlSessionTemplate sqlSession, int aNo) {
		return sqlSession.selectOne("memberMapper.selectAnimalImage", aNo);
	}

}
