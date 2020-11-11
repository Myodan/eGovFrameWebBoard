package myodan.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import myodan.board.mapper.BoardMapper;
import myodan.board.service.BoardService;
import myodan.board.vo.BoardVO;

@Service("boardService")
public class BoardSeriveImpl implements BoardService {

	final BoardMapper boardDAO;

	public BoardSeriveImpl(BoardMapper boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
	}

	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardDAO.deleteBoard(boardVO);
	}

	@Override
	public BoardVO selectBoard(BoardVO boardVO) {
		return boardDAO.selectBoard(boardVO);
	}

	@Override
	public List<BoardVO> selectBoardList() {
		return boardDAO.selectBoardList();
	}

}
