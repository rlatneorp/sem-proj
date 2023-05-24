package semi.project.jsnr.matching.model.service;

import java.util.ArrayList;

import semi.project.jsnr.animal.model.vo.Animal;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;

public interface MatchingService {

	ArrayList<Animal> selectAnimalList(int mNo);
	
	ArrayList<JibsaProfile> selectMatchingResult(Matching mc);

	Jibsa selectJibsa(int jNo);
	
	int insertMatching(Matching mc);
	
	Animal selectAnimal(int aNo);

}
