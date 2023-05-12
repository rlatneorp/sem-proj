package semi.project.jsnr.board.model.service;

import java.util.ArrayList;

import semi.project.jsnr.board.model.vo.Board;
import semi.project.jsnr.common.model.vo.PageInfo;

public interface BoardService {
	int getListCount(int i);

	ArrayList<Board> reviewBoardList(PageInfo pi, int i);
}
