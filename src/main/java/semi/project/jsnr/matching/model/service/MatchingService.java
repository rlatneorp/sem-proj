package semi.project.jsnr.matching.model.service;

import java.util.ArrayList;

import semi.project.jsnr.jibsa.model.vo.JibsaProfile;
import semi.project.jsnr.matching.model.vo.Matching;

public interface MatchingService {

	ArrayList<JibsaProfile> selectMatchingResult(Matching mc);

	int insertMatching(Matching mc);



}
