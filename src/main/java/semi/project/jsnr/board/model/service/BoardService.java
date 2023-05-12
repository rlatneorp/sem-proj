package semi.project.jsnr.board.model.service;

import java.util.ArrayList;

import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;

public interface BoardService {
	int getListCount(int i);

	ArrayList<Board> selectBoardList(PageInfo pi, int i);

	int getJibsaListCount();

	ArrayList<JibsaProfile> selectJibsaProfileList(PageInfo pi);

	Jibsa getJibsaInfo(int mId);

	JibsaProfile getJibsaProfile(int mId);
}
