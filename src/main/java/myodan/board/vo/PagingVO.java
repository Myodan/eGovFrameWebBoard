package myodan.board.vo;

import lombok.Data;

@Data
public class PagingVO {

	int page;
	int pageSize;
	int offset;

	int beginPage;
	int endPage;

	boolean prev;
	boolean next;

	int total;

	public PagingVO(int page, int pageSize, int total) {
		this.page = page;
		this.pageSize = pageSize;
		this.offset = (page - 1) * pageSize;

		this.total = total;

		this.endPage = (int) (Math.ceil(page / 10.0)) * 10;
		this.beginPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / pageSize));

		if (realEnd < this.endPage)
			this.endPage = realEnd;

		this.prev = this.beginPage > 1;
		this.next = this.endPage < realEnd;
	}

}