package semi.project.jsnr.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;

@Repository
public class MatchingDAO {

	public ArrayList<Animal> selectAnimalList(SqlSessionTemplate sqlSession, int mId) {
		return (ArrayList)sqlSession.selectList("matchingMapper.selectAnimalList", mId);
	}
	
	public ArrayList<JibsaProfile> selectMatchingResult(SqlSessionTemplate sqlSession, Matching mc) {
		return (ArrayList)sqlSession.selectList("matchingMapper.selectMatchingResult", mc);
	}

	public Jibsa selectJibsa(SqlSessionTemplate sqlSession, int jNo) {
		return sqlSession.selectOne("matchingMapper.selectJibsa", jNo);
	}
	
	public int insertMatching(SqlSessionTemplate sqlSession, Matching mc) {
		return sqlSession.insert("matchingMapper.insertMatching", mc);
	}

	public Animal selectAnimal(SqlSessionTemplate sqlSession, int aNo) {
		return sqlSession.selectOne("matchingMapper.selectAnimal", aNo);
	}
	
//	public int getAnimalCount(SqlSessionTemplate sqlSession, int mNo) {
//		return sqlSession.selectOne("matchingMapper.getAnimalCount", mNo);
//	}

	public Image imageList(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("matchingMapper.imageList", memberNo);
	}

}
