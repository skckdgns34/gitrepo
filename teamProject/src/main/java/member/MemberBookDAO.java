package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Mywriting;

public class MemberBookDAO {	//내서재 등 관련
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤(하나 만들어두면 불러와서 계속씀)
	static MemberBookDAO instance;

	public static MemberBookDAO getinstance() {
		if (instance == null)
			instance = new MemberBookDAO();
		return instance;
	}

	// 전체조회 (필요한 부분만 뽑아쓰기)
	public ArrayList<Mywriting> selectAll(Mywriting mywritingVO) {
		Mywriting resultVo = null;
		ResultSet rs = null;
		ArrayList<Mywriting> list = new ArrayList<Mywriting>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT MEMBER_NO, MY_TITLE, MY_WRITE_DATE, GENRE, MY_INTRODUCTION,"
					+ "  MY_SUMMARY, IMAGE_URI, SCORE, VIEWS, TEMPORARY_STORAGE, MY_CONTENTS"
					+ " FROM MYWRITING"
					+ " ORDER BY MEMBER_NO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Mywriting();
				resultVo.setMember_no(rs.getString("MEMBER_NO"));
				resultVo.setMy_title(rs.getString("MY_TITLE"));
				resultVo.setMy_write_date(rs.getString("MY_WRITE_DATE"));
				resultVo.setGenre(rs.getString("GENRE"));
				resultVo.setMy_introduction(rs.getString("MY_INTRODUCTION"));
				resultVo.setMy_summary(rs.getString("MY_SUMMARY"));
				resultVo.setImage_uri(rs.getString("IMAGE_URI"));
				resultVo.setScore(rs.getString("SCORE"));
				resultVo.setViews(rs.getString("VIEWS"));
				resultVo.setTemporary_storage(rs.getString("TEMPORARY_STORAGE"));
				resultVo.setMy_contents(rs.getString("MY_CONTENTS"));
				list.add(resultVo);
				System.out.println(rs.getString("MEMBER_NO"));
				System.out.println(rs.getString("MY_TITLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	// 찜목록
	public ArrayList<Mywriting> Myselect(Mywriting mywritingVO) {
		Mywriting resultVo = null;
		ResultSet rs = null;
		ArrayList<Mywriting> list = new ArrayList<Mywriting>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT MEMBER_NO, MY_TITLE, MY_WRITE_DATE, GENRE, VIEWS"
					+ " FROM MYWRITING"
					+ " WHERE MEMBER_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mywritingVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Mywriting();
				resultVo.setMember_no(rs.getString("MEMBER_NO"));
				resultVo.setMy_title(rs.getString("MY_TITLE"));
				resultVo.setMy_write_date(rs.getString("MY_WRITE_DATE"));
				resultVo.setGenre(rs.getString("GENRE"));
				resultVo.setViews(rs.getString("VIEWS"));
				list.add(resultVo);
				System.out.println(rs.getString("MEMBER_NO"));
				System.out.println(rs.getString("MY_TITLE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//찜 내역
	public ArrayList<Books> ticketList(Books booksVO) {
		Books resultVo = null;
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT rownum, m.member_no, b.title, b.writer, b.genre, b.views, l.wish"
					+ " FROM member m, books b, mylibrary l"
					+ " WHERE b.book_no = l.book_no"
					+ " AND m.member_no = l.member_no"
					+ " AND wish = '찜'"
					+ " AND m.member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booksVO.getMember_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new Books();
				resultVo.setTitle(rs.getString("title"));
				resultVo.setWriter(rs.getString("writer"));
				resultVo.setGenre(rs.getString("genre"));
				resultVo.setViews(rs.getString("views"));
				list.add(resultVo);
				System.out.println(rs.getString("rownum"));
				System.out.println(rs.getString("title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
