package semi.project.jsnr.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;

@Repository
public class MatchingDAO {

	public ArrayList<JibsaProfile> selectMatchingResult(SqlSessionTemplate sqlSession, Matching mc) {
		return (ArrayList)sqlSession.selectList("matchingMapper.selectMatchingResult", mc);
	}

}
