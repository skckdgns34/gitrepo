package vo;

import lombok.Data;

@Data
public class Questions {
	private String question_no;
	private String question_date;
	private String question_contents;
	private String question_title;
	private String member_no;
	private String question_file;
	private String question_kind;
	private String member_id;
	private String nickname;
	private String code_value;
	private String question_status;
	private String answer_contents;
	private String answer_date;
	private String rownum;
}
