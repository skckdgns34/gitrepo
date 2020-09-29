package memberManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import common.ConnectionManager;
import vo.Blacklist;
import vo.Member;
import vo.Questions;

public class QuestionDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static QuestionDAO instance;

	public static QuestionDAO getinstance() {
		if (instance == null)
			instance = new QuestionDAO();
		return instance;
	}

	// 전체조회
	public List<Questions> selectAll(Questions questions) {
	
		List<Questions> list = new ArrayList<Questions>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT M.MEMBER_ID, Q.MEMBER_NO, M.NICKNAME, Q.QUESTION_NO,  Q.QUESTION_DATE,  Q.QUESTION_CONTENTS, "
					+ " Q.QUESTION_TITLE, Q.QUESTION_FILE, Q.QUESTION_KIND "
					+ " FROM QUESTIONS Q,   MEMBER M "
					+ " WHERE M.MEMBER_NO = Q.MEMBER_NO";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Questions q = new Questions();
				Member m = new Member();
				q.setMember_id(rs.getString("member_id"));
				q.setMember_no(rs.getString("member_no"));
				q.setNickname(rs.getString("nickname"));
				q.setQuestion_no(rs.getString("question_no"));
				q.setQuestion_date(rs.getString("question_date"));
				q.setQuestion_contents(rs.getString("question_contents"));
				q.setQuestion_title(rs.getString("question_title"));
				q.setQuestion_file(rs.getString("question_file"));
				q.setQuestion_kind(rs.getString("question_kind"));

				list.add(q);
				
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
/* 
	// 단건조회
	public Blacklist selectOne(Blacklist black) {
		Blacklist resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT BLACKLIST_NO, BLACKLIST_REASON, MEMBER_NO, LIMIT_DATE"
					+ " FROM BLACKLIST"
					+ " WHERE BLACKLIST_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new Blacklist();
				resultVO.setBlacklist_no(rs.getString("blacklist_no"));
				resultVO.setBlacklist_reason(rs.getString("blacklist_reason"));
				resultVO.setMember_no(rs.getString("member_no"));
				resultVO.setLimit_date(rs.getString("limit_date"));
				
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}

	public void delete(Blacklist black) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete blacklist where blacklist_no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public void update(Blacklist black) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update blacklist set blacklist_reason = ?, limit_date= ?  where blacklist_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, black.getBlacklist_reason());
			pstmt.setString(2, black.getLimit_date());
			pstmt.setString(3, black.getBlacklist_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public Member insert(Blacklist black) {
		Blacklist resultVO = null;
		try {

			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			  //보드 번호 조회
	         String seqSql = "select no from seq where tablename= 'blacklist'";
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(seqSql);
	         rs.next();
	         int no = rs.getInt(1);
	         black.setBlacklist_no(Integer.toString(no));
	         
	         
	         //보드 번호 업데이트
	         seqSql = "update seq set no = no + 1 where tablename = 'blacklist'";
	         stmt = conn.createStatement();
	         stmt.executeUpdate(seqSql);

			// 2.sql 구문실행
			/*String sql = "insert into member (blacklist_no, blacklist_reason, member_no, limit_date)"
					+ " values (?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, memberVO.getMember_id());
			pstmt.setString(3, memberVO.getMember_pw());
			pstmt.setString(4, memberVO.getNickname());
			pstmt.setString(5, memberVO.getMember_tel());
			pstmt.setString(6, memberVO.getMember_email());
			pstmt.setString(7, memberVO.getGender());
			int r = pstmt.executeUpdate();

			// 3.결과처리
			//System.out.println(r + " 건이 처리됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// 4.연결해제
			ConnectionManager.close(conn);
		}
		return null;
	}
	*/
	
}

