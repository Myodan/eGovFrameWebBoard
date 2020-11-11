package myodan.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import myodan.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	final BoardService boardService;

	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@GetMapping("/list.do")
	public String getBoardList(Model model) {
		model.addAttribute("boardList", boardService.selectBoardList());
		return "/board/list";
	}

}