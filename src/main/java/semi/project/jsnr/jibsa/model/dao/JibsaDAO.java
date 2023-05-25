package semi.project.jsnr.jibsa.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;
import semi.project.jsnr.member.model.vo.Member;

@Repository
public class JibsaDAO {

	public int insertJibsa(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.insert("jibsaMapper.insertJibsa", j);
	}
	
	public int updateMemberInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("jibsaMapper.updateMemberInfo", m);
	}

	public int updateJibsaInfo(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.update("jibsaMapper.updateJibsaInfo", j);
	}

	public int deleteInfo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.update("jibsaMapper.deleteJibsa", memberNo);
	}

	public Jibsa selectJibsa(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("jibsaMapper.selectJibsa", memberNo);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("jibsaMapper.insertImage", image);
	}

	public int updateJibsaAvailableHour(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.update("jibsaMapper.updateJibsaAvailableHour", j);
	}

	public int insertJibsaProfile(SqlSessionTemplate sqlSession, JibsaProfile jp) {
		return sqlSession.insert("jibsaMapper.insertJibsaProfile", jp);
	}

	public ArrayList<Board> selectMatchingList(SqlSessionTemplate sqlSession, PageInfo pi, int mNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("jibsaMapper.selectMatchingList", mNo, rowBounds);
	}

	public Image selectImage(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("jibsaMapper.selectImage", map);
	}

	public int cancelMatching(SqlSessionTemplate sqlSession, Integer mcNo) {
		return sqlSession.update("jibsaMapper.cancelMatching", mcNo);
	}

	public Board selectMatching(SqlSessionTemplate sqlSession, String mcNo) {
		return sqlSession.selectOne("jibsaMapper.selectMatching", mcNo);
	}

	public int updateMatching(SqlSessionTemplate sqlSession, Matching mc) {
		return sqlSession.update("jibsaMapper.updateMatching", mc);
	}

	public int getMatchingCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("jibsaMapper.getMatchingCount", mNo);
	}

	public int insertTrainer(SqlSessionTemplate sqlSession, Jibsa j) {
		return sqlSession.insert("jibsaMapper.insertTrainer", j);
	}

	public ArrayList<JibsaProfile> selectReserJibsa(SqlSessionTemplate sqlSession, int jibsaNo) {
		return (ArrayList)sqlSession.selectList("jibsaMapper.selectReserJibsa", jibsaNo);
	}

	public Image selectImage2(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("jibsaMapper.selectImage2", memberNo);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, Image existingImage) {
		return sqlSession.delete("jibsaMapper.deleteImage", existingImage);
	}

	public int insertPremium(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("jibsaMapper.insertPremium", map);
	}


	public ArrayList<Image> todayJibsaImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("jibsaMapper.todayJibsaImage");
	}




}
