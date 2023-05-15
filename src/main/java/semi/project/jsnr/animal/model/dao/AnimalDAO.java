package semi.project.jsnr.animal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.project.jsnr.animal.model.vo.Animal;

@Repository
public class AnimalDAO {
	
	public Animal animalList(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("AnimalMapper.animalList", memberNo);
	}
	
	public Animal animalEditList(SqlSessionTemplate sqlSession, Animal a) {
		return sqlSession.selectOne("AnimalMapper.animalList", a);
	}
	
	public int updateAnimal(SqlSessionTemplate sqlSession, Animal a) {
		return sqlSession.update("AnimalMapper.updateAnimal", a);
	}

	public int insertAnimal(SqlSessionTemplate sqlSession, Animal a) {
		return sqlSession.insert("AnimalMapper.insertAnimal", a);
	}

	
	
}
