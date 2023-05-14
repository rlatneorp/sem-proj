package semi.project.jsnr.animal.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.dao.AnimalDAO;
import semi.project.jsnr.animal.model.vo.Animal;

@Service
public class AnimalServiceImpl implements AnimalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AnimalDAO aDAO;
	
	@Override
	public Animal animalList(int memberNo) {
		return aDAO.animalList(sqlSession, memberNo);
	}
	
	@Override
	public Animal animalEditList(Animal a) {
		return aDAO.animalEditList(sqlSession, a);
	}
	
	@Override
	public int updateAnimal(Animal a) {
		return aDAO.updateAnimal(sqlSession, a);
	}
}
