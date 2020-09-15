package vo;

import lombok.Data;

@Data
public class Mywriting {
	private String member_no;
	private String my_title;
	private String my_contents;
	private String my_write_date;
	private String genre;
	private String my_introduction;
	private String my_summary;
	private String image_uri;
	private String score;
	private String views;
	private String temporary_storage;
}
