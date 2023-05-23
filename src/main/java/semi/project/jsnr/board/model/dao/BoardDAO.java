package semi.project.jsnr.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Image;
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

	public ArrayList<Board> reviewBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.reviewBoardList", pi, rowBounds);
	}

	public int getJibsaListCount(SqlSessionTemplate sqlSession, int selectType) {
		return sqlSession.selectOne("boardMapper.getJibsaListCount", selectType);
	}

	public ArrayList<JibsaProfile> selectJibsaProfileList(SqlSessionTemplate sqlSession, PageInfo pi, int selectType) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectJibsaProfileList", selectType, rowBounds);
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

//	public ArrayList<Board> selectReply(SqlSessionTemplate sqlSession, int mId) {
//		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", mId);
//	}

	public Board reviewDetail(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.reviewDetail", mId);
	}

	public ArrayList<Image> selectJibsaImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectJibsaImageList");
	}

	public void deleteReply(SqlSessionTemplate sqlSession, Board b) {
		sqlSession.update("boardMapper.deleteReply", b);
	}

//	public ArrayList<Board> jibsaReview(SqlSessionTemplate sqlSession, String jibsaName, PageInfo pi) {
//		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		return (ArrayList)sqlSession.selectList("boardMapper.jibsaReview", pi, rowBounds);
//	}
//
//	public int jibsaReviewCount(SqlSessionTemplate sqlSession, String jibsaName, int i) {
//		return sqlSession.selectOne("boardMapper.jibsaReviewCount", i);
//	}

	public int jibsaPageReviewCount(SqlSessionTemplate sqlSession, String jibsaName) {
		return sqlSession.selectOne("boardMapper.jibsaPageReviewCount", jibsaName);
	}
	public List<Object> jibsaPageReviewCount2(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("boardMapper.jibsaPageReviewCount2", map);
	}

	public ArrayList<Board> jibsaPageReviewDetail(SqlSessionTemplate sqlSession, String jibsaName) {
		return (ArrayList)sqlSession.selectList("boardMapper.jibsaPageReviewDetail", jibsaName);
	}

	public ArrayList<Board> jibsaReviewDateSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("boardMapper.jibsaReviewDateSearch", map);
	}

	public ArrayList<Board> reviewList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.reviewList", map, rowBounds);
	}

	public int sortListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.sortListCount", map);
	}

	public Image selectJibsaImage(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("boardMapper.selectJibsaImage", mId);
	}

	public Image selectAnimalImage(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("boardMapper.selectAnimalImage", mNo);
	}
	

//	public ArrayList<Board> member_Review(SqlSessionTemplate sqlSession, String userName) {
//		return (ArrayList)sqlSession.selectList("boardMapper.member_Review", userName);
//	}
//
//
//	public int member_Review_Detail(SqlSessionTemplate sqlSession, Board b) {
//		return sqlSession.update("boardMapper.member_Review_Detail", b);
//	}
//

}

