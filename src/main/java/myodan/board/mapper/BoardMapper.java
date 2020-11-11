package myodan.board.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import myodan.board.vo.BoardVO;

@Mapper("boardMapper")
public interface BoardMapper {

	void insertBoard(BoardVO boardVO);

	void updateBoard(BoardVO boardVO);

	void deleteBoard(BoardVO boardVO);

	BoardVO selectBoard(BoardVO boardVO);

	List<BoardVO> selectBoardList();

}
