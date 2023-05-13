package semi.project.jsnr.animal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Animal;

@Repository
public class AnimalDAO {
	
	public ArrayList<Animal> AnimalList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("AnimalMapper.AnimalList", memberNo);
	}
	
	public int insertAnimal(SqlSessionTemplate sqlSession, Animal a) {
		return sqlSession.insert("AnimalMapper.insertAnimal", a);
	}

	
	
}
