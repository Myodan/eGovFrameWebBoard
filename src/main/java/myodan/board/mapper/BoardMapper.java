package myodan.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import myodan.board.vo.BoardVO;
import myodan.board.vo.PagingVO;
import myodan.board.vo.SearchPagingVO;

@Mapper("boardMapper")
public interface BoardMapper {

	void insertBoard(BoardVO boardVO);

	void updateBoard(BoardVO boardVO);

	void updateBoardViews(int id);

	void deleteBoard(int id);

	BoardVO selectBoard(int id);

	List<BoardVO> selectBoardList();

	List<BoardVO> selectBoardListWithPaging(PagingVO pagingVO);

	int selectBoardTotal();

	List<BoardVO> selectBoardListSearch(@Param("searchOption") String searchOption, @Param("keyword") String keyword);

	List<BoardVO> selectBoardListSearchWithPaging(SearchPagingVO searchPagingVO);

	int selectBoardListSearchTotal(@Param("searchOption") String searchOption, @Param("keyword") String keyword);

}
