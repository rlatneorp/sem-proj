package semi.project.jsnr.animal.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.project.jsnr.animal.model.dao.AnimalDAO;
import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.animal.model.vo.Image;

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
	public int updateAnimal(Animal a) {
		return aDAO.updateAnimal(sqlSession, a);
	}
	
	@Override
	public int insertAnimal(Animal a) {
		return aDAO.insertAnimal(sqlSession, a);
	}
	
	@Override
	public int deleteAnimal(Animal a) {
		return aDAO.deleteAnimal(sqlSession, a);
	}
	
	@Override
	public int insertImage(Image image) {
		return aDAO.insertImage(sqlSession, image);
	}
	
	@Override
	public Image selectImage(int memberNo) {
		return aDAO.selectImage(sqlSession, memberNo);
	}
	
	@Override
	public int editImage(Image image) {
		return aDAO.editImage(sqlSession, image);
	}
	
	@Override
	public int deleteImage(Image image) {
		return aDAO.deleteImage(sqlSession, image);
	}

}
