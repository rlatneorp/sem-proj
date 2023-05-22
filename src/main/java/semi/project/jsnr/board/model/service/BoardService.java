package semi.project.jsnr.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import semi.project.jsnr.animal.model.vo.Image;
import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.Faq;
import semi.project.jsnr.board.model.vo.Qna;
import semi.project.jsnr.common.model.vo.PageInfo;
import semi.project.jsnr.jibsa.model.vo.Jibsa;
import semi.project.jsnr.jibsa.model.vo.JibsaProfile;

public interface BoardService {
	
	int getListCount(int i);

	ArrayList<Board> reviewBoardList(PageInfo pi);

	int getJibsaListCount(int selectType);

	ArrayList<JibsaProfile> selectJibsaProfileList(PageInfo pi, int selectType);

	Jibsa getJibsaInfo(int mId);

	JibsaProfile getJibsaProfile(int mId);

	int getQnaListCount();

	ArrayList<Qna> selectQnaList(PageInfo pi);

	ArrayList<Faq> selectFaqList(PageInfo pi);

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);

	Board reviewDetail(int mId, boolean yn);

	Board selectReply(int mId);

	void updateReply(Board b);

	ArrayList<Image> selectJibsaImageList();

	void deleteReply(Board b);

	ArrayList<Board> jibsaReview(String jibsaName, boolean yn);

	ArrayList<Board> jibsaReviewDateSearch(HashMap<String, String> map, boolean yn);

	List<Object> jibsaPageReviewCount2(HashMap<String, String> map);

	ArrayList<Board> reviewList(HashMap<String, String> map, PageInfo pi);

	int sortListCount(HashMap<String, String> map);

	Image selectJibsaImage(int mId);

//	ArrayList<Board> member_Review_Detail(String userName);
//
//	

}
