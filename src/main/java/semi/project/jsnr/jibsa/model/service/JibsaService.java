package semi.project.jsnr.jibsa.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.jibsa.model.dao.JibsaDAO;
import semi.project.jsnr.member.model.vo.Member;

@Service
public class JibsaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JibsaDAO jDAO;

	public int updateJibsa(Member m) {
		return jDAO.updateJibsa(sqlSession, m);
	}

	public int enrollJibsa(Member m) {
		return jDAO.enrollJibsa(sqlSession, m);
	}
	
	
}
