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
	public int insertAnimal(Animal a) {
		return aDAO.insertAnimal(sqlSession, a);
	}

}
