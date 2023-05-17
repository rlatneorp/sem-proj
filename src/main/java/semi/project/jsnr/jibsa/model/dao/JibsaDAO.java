package semi.project.jsnr.jibsa.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
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
		return 0;
	}

}
