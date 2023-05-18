package semi.project.jsnr.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;

@Repository
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.getListCount", i);
	}

	public ArrayList<Board> reviewBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.reviewBoardList", i, rowBounds);
	}

	public int getJibsaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getJibsaListCount");
	}

	public ArrayList<JibsaProfile> selectJibsaProfileList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectJibsaProfileList", pi, rowBounds);
	}

	public Jibsa getJibsaInfo(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.getJibsaInfo", mId);
	}

	public JibsaProfile getJibsaProfile(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.getJibsaProfile", mId);
	}

	public int getQnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getQnaListCount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnaList", pi, rowBounds);
	}

	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqList", pi, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.update("boardMapper.reviewCount", mId);
	}


	public Board selectReply(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.selectReply", mId);
	}

	public void updateReply(SqlSessionTemplate sqlSession, Board b) {
		sqlSession.update("boardMapper.updateReply", b);
		
	}

	public Board reviewDetail(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.reviewDetail", mId);
	}
}

