package semi.project.jsnr.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.board.model.dao.BoardDAO;
import semi.project.jsnr.board.model.vo.Board;
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
	public ArrayList<Board> reviewBoardList(PageInfo pi, int i) {
		return bDAO.reviewBoardList(sqlSession, pi, i);
	}

	@Override
	public int getJibsaListCount() {
		return bDAO.getJibsaListCount(sqlSession);
	}

	@Override
	public ArrayList<JibsaProfile> selectJibsaProfileList(PageInfo pi) {
		return bDAO.getSelectJibsaProfileList(sqlSession, pi);
	}

	@Override
	public Jibsa getJibsaInfo(int mId) {
		return bDAO.getJibsaInfo(sqlSession, mId);
	}

	@Override
	public JibsaProfile getJibsaProfile(int mId) {
		return bDAO.getJibsaProfile(sqlSession, mId);
	}



}
