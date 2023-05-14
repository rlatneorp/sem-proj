package semi.project.jsnr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import semi.project.jsnr.board.model.service.BoardService;

@Controller
public class FaqController {

	@Autowired
	private BoardService bService;
	
	
}
