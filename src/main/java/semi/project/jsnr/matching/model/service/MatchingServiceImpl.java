package semi.project.jsnr.matching.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.dao.MatchingDAO;
import semi.project.jsnr.matching.model.vo.Matching;

@Service
public class MatchingServiceImpl implements MatchingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MatchingDAO mcDAO;
	
	@Override
	public ArrayList<Animal> selectAnimalList(int mId) {
		return mcDAO.selectAnimalList(sqlSession, mId);
	}
	
	@Override
	public ArrayList<JibsaProfile> selectMatchingResult(Matching mc) {
		return mcDAO.selectMatchingResult(sqlSession, mc);
	}

	@Override
	public Jibsa selectJibsa(int jNo) {
		return mcDAO.selectJibsa(sqlSession, jNo);
	}
	
	@Override
	public int insertMatching(Matching mc) {
		return mcDAO.insertMatching(sqlSession, mc);
	}

	@Override
	public Animal selectAnimal(int aNo) {
		return mcDAO.selectAnimal(sqlSession, aNo);
	}

//	@Override
//	public int getAnimalCount(int mNo) {
//		return mcDAO.getAnimalCount(sqlSession, mNo);
//	}


}
