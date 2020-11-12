package myodan.board.service;

import java.util.List;

import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;

public interface BoardService {

	void insertBoard(BoardVO boardVO);

	void updateBoard(BoardVO boardVO);

	void deleteBoard(BoardVO boardVO);

	BoardVO selectBoard(int id);

	List<BoardVO> selectBoardList();

	List<BoardVO> selectBoardListWithPaging(PagingVO pagingVO);

	int selectBoardTotal();

}
