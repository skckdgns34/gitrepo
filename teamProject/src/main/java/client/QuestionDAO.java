package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.FAQ;
import vo.Questions;

public class QuestionDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static QuestionDAO instance;

	public static QuestionDAO getinstance() {
		if (instance == null)
			instance = new QuestionDAO();
		return instance;
	}

	// 전체조회
	public ArrayList<Questions> selectAll(Questions questions) {
		ArrayList<Questions> list = new ArrayList<Questions>();
		Questions result = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT q.question_no, q.question_date, q.question_contents, q.question_title, q.question_file, c.code_value, q.question_status"
					+ " FROM questions q, common c"
					+ " WHERE q.question_kind = c.code and q.member_no = ?"
					+ " ORDER BY 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questions.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = new Questions();
				result.setQuestion_no(rs.getString(1));
				result.setQuestion_date(rs.getString(2));
				result.setQuestion_contents(rs.getString(3));
				result.setQuestion_title(rs.getString(4));
				result.setQuestion_file(rs.getString(5));
				result.setCode_value(rs.getString(6));
				result.setQuestion_status(rs.getString(7));
				list.add(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}


}
