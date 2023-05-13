package semi.project.jsnr.jibsa.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.member.model.vo.Member;

@Repository
public class JibsaDAO {

	public int insertJibsa(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("jibsaMapper.insertJibsa", m);
	}
}
