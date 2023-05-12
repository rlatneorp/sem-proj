package semi.project.jsnr.jibsa.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.member.model.vo.Member;

@Repository
public class JibsaDAO {

	public int updateJibsa(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("jibsaMapper.updateJibsa", m);
	}

	public int enrollJibsa(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("jibsaMapper.enrollJibsa", m);
	}
}
