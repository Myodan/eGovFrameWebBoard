package myodan.board.service;

import java.util.List;

import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;
import myodan.board.vo.SearchPagingVO;

public interface BoardService {

	void insertBoard(BoardVO boardVO);

	void updateBoard(BoardVO boardVO);

	void updateBoardViews(int id);

	void deleteBoard(int id);

	BoardVO selectBoard(int id);

	List<BoardVO> selectBoardList();

	List<BoardVO> selectBoardListWithPaging(PagingVO pagingVO);

	int selectBoardTotal();

	List<BoardVO> selectBoardListSearch(String searchOption, String keyword);

	List<BoardVO> selectBoardListSearchWithPaging(SearchPagingVO searchPagingVO);

	int selectBoardListSearchTotal(String searchOption, String keyword);
}
