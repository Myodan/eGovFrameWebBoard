package myodan.board.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {

	int id;
	String title;
	String content;
	String author;
	int views;
	Timestamp createdDate;
	Timestamp updatedDate;

}
