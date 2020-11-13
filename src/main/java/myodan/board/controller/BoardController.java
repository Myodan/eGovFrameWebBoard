package myodan.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myodan.board.service.BoardService;
import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;
import myodan.board.vo.SearchPagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	final BoardService boardService;

	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@GetMapping("/list.do")
	public String getList(@RequestParam(defaultValue = "1") int page, Model model) {
		PagingVO pagingVO = new PagingVO(page, 20, boardService.selectBoardTotal());
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("boardList", boardService.selectBoardListWithPaging(pagingVO));
		return "/board/list";
	}

	@GetMapping("/search.do")
	public String getSearch(@RequestParam(defaultValue = "1") int page, @RequestParam String searchOption,
			@RequestParam String keyword, Model model) {

		int boardListTotal = boardService.selectBoardListSearchTotal(searchOption, keyword);
		SearchPagingVO searchPagingVO = new SearchPagingVO(searchOption, keyword, page, 20, boardListTotal);

		model.addAttribute("searchPagingVO", searchPagingVO);
		model.addAttribute("boardList", boardService.selectBoardListSearchWithPaging(searchPagingVO));

		return "/board/search";
	}

	@PostMapping("/search.do")
	public String postSearch(@RequestParam(defaultValue = "1") int page, String searchOption, String keyword) {
		return "redirect:/board/search.do?page=" + page + "&searchOption=" + searchOption + "&keyword=" + keyword;
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
		boardService.updateBoardViews(id);
		return "/board/detail";
	}

	@PostMapping("/delete.do")
	public String postDelete(@RequestParam int id, @RequestParam(defaultValue = "1") int page,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		BoardVO boardVO = boardService.selectBoard(id);

		if (!boardVO.getAuthor().equals(session.getAttribute("username"))) {
			return "redirect:/";
		}

		boardService.deleteBoard(id);

		return "redirect:/";
	}

	@GetMapping("/edit.do")
	public String getEdit(@RequestParam int id, @RequestParam(defaultValue = "1") int page, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		BoardVO boardVO = boardService.selectBoard(id);

		if (!boardVO.getAuthor().equals(session.getAttribute("username"))) {
			return "redirect:/";
		}

		model.addAttribute("page", page);
		model.addAttribute("board", boardVO);

		return "/board/edit";
	}

	@PostMapping("/edit.do")
	public String postEdit(@RequestParam(defaultValue = "1") int page, BoardVO boardVO, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (!boardVO.getAuthor().equals(session.getAttribute("username"))) {
			return "redirect:/";
		}

		boardService.updateBoard(boardVO);
		return "redirect:/board/detail.do?id=" + boardVO.getId() + "&page=" + page;
	}

}