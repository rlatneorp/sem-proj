package semi.project.jsnr.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.dao.BoardDAO;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;


@Service("bService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public int getListCount(int i) {
		return bDAO.getListCount(sqlSession, i);
	}

	@Override
	public ArrayList<Board> reviewBoardList(PageInfo pi) {
		return bDAO.reviewBoardList(sqlSession, pi);
	}

	@Override
	public int getJibsaListCount(int selectType) {
		return bDAO.getJibsaListCount(sqlSession, selectType);
	}

	@Override
	public ArrayList<JibsaProfile> selectJibsaProfileList(PageInfo pi, int selectType) {
		return bDAO.selectJibsaProfileList(sqlSession, pi, selectType);
	}

	@Override
	public Jibsa getJibsaInfo(int mId) {
		return bDAO.getJibsaInfo(sqlSession, mId);
	}

	@Override
	public JibsaProfile getJibsaProfile(int mId) {
		return bDAO.getJibsaProfile(sqlSession, mId);
	}

	@Override
	public int getQnaListCount() {
		return bDAO.getQnaListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return bDAO.selectQnaList(sqlSession, pi);
	}

	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return bDAO.selectFaqList(sqlSession, pi);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return bDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return bDAO.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public Board reviewDetail(int mId, boolean yn) {
		int result = 0;
		if(yn) {
			result = bDAO.reviewCount(sqlSession, mId);
		}
		Board b = bDAO.reviewDetail(sqlSession, mId);
			
		return b;
	}

	@Override
	public Board selectReply(int mId) {
		return bDAO.selectReply(sqlSession, mId);
	}

	@Override
	public void updateReply(Board b) {
		bDAO.updateReply(sqlSession, b);
	}

	@Override
	public ArrayList<Image> selectJibsaImageList() {
		return bDAO.selectJibsaImageList(sqlSession);
	}

	@Override
	public void deleteReply(Board b) {
		bDAO.deleteReply(sqlSession, b);
	}

//	@Override
//	public ArrayList<Board> jibsaReview(String jibsaName, PageInfo pi) {
//		return bDAO.jibsaReview(sqlSession, jibsaName, pi);
//	}
//
//	@Override
//	public int jibsaReviewCount(String jibsaName, int i) {
//		return bDAO.jibsaReviewCount(sqlSession,jibsaName, i);
//	}

	@Override
	public ArrayList<Board> jibsaReview(String jibsaName, boolean yn) {
		int result = 0;
		if(yn) {
			result = bDAO.jibsaPageReviewCount(sqlSession, jibsaName);
		}
		ArrayList<Board> b = bDAO.jibsaPageReviewDetail(sqlSession, jibsaName);
			
		return b;
	}


	@Override
	public ArrayList<Board> jibsaReviewDateSearch(HashMap<String, String> map, boolean yn) {
		List<Object> result = null;
		if(yn) {
			result = bDAO.jibsaPageReviewCount2(sqlSession, map);
		}
		ArrayList<Board> b = bDAO.jibsaReviewDateSearch(sqlSession, map);
			
		return b;
	}

	@Override
	public List<Object> jibsaPageReviewCount2(HashMap<String, String> map) {
		return bDAO.jibsaPageReviewCount2(sqlSession, map);
	}
		

}






