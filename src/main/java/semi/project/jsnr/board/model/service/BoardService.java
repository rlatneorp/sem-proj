package semi.project.jsnr.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;

public interface BoardService {
	int getListCount(int i);

	ArrayList<Board> reviewBoardList(PageInfo pi);

	int getJibsaListCount();

	ArrayList<JibsaProfile> selectJibsaProfileList(PageInfo pi);

	Jibsa getJibsaInfo(int mId);

	JibsaProfile getJibsaProfile(int mId);

	int getQnaListCount();

	ArrayList<Qna> selectQnaList(PageInfo pi);

	ArrayList<Faq> selectFaqList(PageInfo pi);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);

//	Board reviewDetail(int mId, boolean yn);

//	ArrayList<Board> reviewDetailReply(int mId);
	Board reviewDetail(int mId, boolean yn);

	ArrayList<Board> selectReply(int mId);

	void updateReply(Board b);





}
