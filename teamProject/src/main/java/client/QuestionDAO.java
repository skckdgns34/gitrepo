package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
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
			String sql = " SELECT q.question_no, q.question_date, q.question_title, q.question_file, c.code_value, q.question_status"
					+ " FROM questions q, common c"
					+ " WHERE q.question_kind = c.code and q.member_no = ? and question_title is not null"
					+ " ORDER BY 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questions.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = new Questions();
				result.setQuestion_no(rs.getString(1));
				result.setQuestion_date(rs.getString(2));
				result.setQuestion_title(rs.getString(3));
				result.setQuestion_file(rs.getString(4));
				result.setCode_value(rs.getString(5));
				result.setQuestion_status(rs.getString(6));
				list.add(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//문의사항 상세조회
	public Questions selectOne(Questions questions) {
		Questions result = null;
		try {conn = ConnectionManager.getConnnect();
		String sql = "SELECT q.question_date, q.question_contents, q.question_title,"
				+ " c.code_value, q.question_status, a.answer_contents, a.answer_date"
				+ " FROM questions q, common c, answer a"
				+ " WHERE q.question_no = a.question_no and q.question_kind = c.code and q.question_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questions.getQuestion_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = new Questions();
				result.setQuestion_date(rs.getString(1));
				result.setQuestion_contents(rs.getString(2));
				result.setQuestion_title(rs.getString(3));
				result.setCode_value(rs.getString(4));
				result.setQuestion_status(rs.getString(5));
				result.setAnswer_contents(rs.getString(6));
				result.setAnswer_date(rs.getString(7));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	//문의사항 수정
	public Questions update(Questions questions) {
		Questions result = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "UPDATE questions SET question_title=?, question_contents=?, question_file=?, question_kind=?, "
	         			+ "WHERE question_no = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, result.getQuestion_title());
	         pstmt.setString(2, result.getQuestion_contents());
	         pstmt.setString(3, result.getQuestion_file());
	         pstmt.setString(4, result.getQuestion_kind());
	         pstmt.setString(5, result.getQuestion_no());
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(null, pstmt, conn);
	      }
	      return result;
	   }
	
	
	//문의사항 등록
	public int insert (Questions questions) {
		int no = 0;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'questions'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			no = rs.getInt(1);
			questions.setQuestion_no(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'questions'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into questions"
					+ " values(?,sysdate,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questions.getQuestion_no());
			pstmt.setString(2, questions.getQuestion_contents());
			pstmt.setString(3, questions.getQuestion_title());
			pstmt.setString(4, questions.getMember_no());
			pstmt.setString(5, questions.getQuestion_file());
			pstmt.setString(6, questions.getQuestion_kind());
			pstmt.setString(7, questions.getQuestion_status());
			pstmt.executeUpdate();
			conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			ConnectionManager.close(conn);
		}
		return no;
	}

}
