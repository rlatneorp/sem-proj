package semi.project.jsnr.board.model.service;

import java.util.ArrayList;

import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.board.model.vo.PageInfo;

public interface BoardService {
	int getListCount(int i);

	ArrayList<Board> selectBoardList(PageInfo pi, int i);
}
