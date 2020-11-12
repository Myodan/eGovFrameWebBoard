package myodan.board.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;

@Mapper("boardMapper")
public interface BoardMapper {

	void insertBoard(BoardVO boardVO);

	void updateBoard(BoardVO boardVO);

	void deleteBoard(BoardVO boardVO);

	BoardVO selectBoard(int id);

	List<BoardVO> selectBoardList();

	List<BoardVO> selectBoardListWithPaging(PagingVO pagingVO);

	int selectBoardTotal();

}
