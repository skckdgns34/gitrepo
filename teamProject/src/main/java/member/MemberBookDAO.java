package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
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

	// 전체조회
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
}
