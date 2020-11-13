package myodan.board.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class SearchPagingVO extends PagingVO {

	String searchOption;
	String keyword;

	public SearchPagingVO(String searchOption, String keyword, int page, int pageSize, int total) {
		super(page, pageSize, total);

		this.searchOption = searchOption;
		this.keyword = keyword;
	}

}
