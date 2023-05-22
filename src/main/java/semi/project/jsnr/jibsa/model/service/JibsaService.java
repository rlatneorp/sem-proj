package semi.project.jsnr.jibsa.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.dao.JibsaDAO;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Service
public class JibsaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JibsaDAO jDAO;

	public int insertJibsa(Jibsa j) {
		return jDAO.insertJibsa(sqlSession, j);
	}
	
	public int updateMemberInfo(Member m) {
		return jDAO.updateMemberInfo(sqlSession, m);
	}

	public int updateJibsaInfo(Jibsa j) {
		return jDAO.updateJibsaInfo(sqlSession, j);
	}

	public int deleteInfo(int memberNo) {
		return jDAO.deleteInfo(sqlSession, memberNo);
	}

	public Jibsa selectJibsa(int memberNo) {
		return jDAO.selectJibsa(sqlSession, memberNo);
	}

	public int updateJibsaAvailableHour(Jibsa j) {
		return jDAO.updateJibsaAvailableHour(sqlSession, j);
	}
	
	public int insertImage(Image image) {
		return jDAO.insertImage(sqlSession, image);
	}

	public int insertJibsaProfile(Jibsa j) {
		return jDAO.insertJibsaProfile(sqlSession, j);
	}

	public ArrayList<Board> selectMatchingList(PageInfo pi, int mNo) {
		return jDAO.selectMatchingList(sqlSession, pi, mNo);
	}

	public Image selectImage(HashMap<String, Integer> map) {
		return jDAO.selectImage(sqlSession, map);
	}

	public int cancelMatching(Integer mcNo) {
		return jDAO.cancelMatching(sqlSession, mcNo);
	}

	public Board selectMatching(String mcNo) {
		return jDAO.selectMatching(sqlSession, mcNo);
	}

	public int updateMatching(Matching mc) {
		return jDAO.updateMatching(sqlSession, mc);
	}

	public int getMatchingCount(int mNo) {
		return jDAO.getMatchingCount(sqlSession, mNo);
	}
	
	public Jibsa jibsa_Main(int memberNo) {
		return jDAO.selectJibsa(sqlSession, memberNo);
	}

	public Jibsa selectJibsaChat(int jibsaNo) {
		return jDAO.selectJibsaChat(sqlSession, jibsaNo);
	}

	
	
	
}
