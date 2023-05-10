package semi.project.jsnr.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.member.model.dao.MemberDAO;
import semi.project.jsnr.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	public Member login(String memberId) {
		return mDAO.login(sqlSession, memberId);
	}
}
