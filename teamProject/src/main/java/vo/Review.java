package vo;

import lombok.Data;

@Data
public class Review {
	private String review_no;
	private String contents;
	private String review_date;
	private String member_no;
	private String book_no;
}
