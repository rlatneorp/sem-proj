package semi.project.jsnr.jibsa.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.member.model.vo.Member;

@Repository
public class JibsaDAO {

	public int insertJibsa(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("jibsaMapper.insertJibsa", m);
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

}
