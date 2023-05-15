package semi.project.jsnr.animal.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.jsnr.animal.model.vo.Animal;

public interface AnimalService {
	
	Animal animalList(int memberNo);

	int updateAnimal(Animal a);

	int insertAnimal(Animal a);

	int deleteAnimal(Animal a);
	

}
