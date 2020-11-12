package myodan.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myodan.board.service.BoardService;
import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	final BoardService boardService;

	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@GetMapping("/list.do")
	public String getList(@RequestParam(defaultValue = "1") int page, Model model) {
		PagingVO pagingVO = new PagingVO(page, 10, boardService.selectBoardTotal());
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("boardList", boardService.selectBoardListWithPaging(pagingVO));
		return "/board/list";
	}

	@PostMapping("/list.do")
	public String postList() {

		return "/board/list";
	}

	@GetMapping("/post.do")
	public String getPost(HttpServletRequest request) {
		if (request.getSession(false).getAttribute("username") == null) {
			return "redirect:/";
		}
		return "/board/post";
	}

	@PostMapping("/post.do")
	public String postPost(BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		return "redirect:/board/list.do";
	}

	@GetMapping("/detail.do")
	public String getDetail(@RequestParam int id, @RequestParam(defaultValue = "1") int page, Model model) {
		model.addAttribute("page", page);
		model.addAttribute("board", boardService.selectBoard(id));
		return "/board/detail";
	}

}