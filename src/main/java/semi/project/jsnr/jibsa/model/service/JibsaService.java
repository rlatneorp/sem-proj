package semi.project.jsnr.jibsa.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.jibsa.model.dao.JibsaDAO;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
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

	
	
	
}
