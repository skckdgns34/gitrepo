package createBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;

public class CreateBookDAO {
	Connection conn = null;
	PreparedStatement pstmt;

	static CreateBookDAO instance;

	public static CreateBookDAO getInstance() {
		if (instance == null)
			instance = new CreateBookDAO();
		return instance;
	}
	
	//유저들이 쓴 글 목록
	public ArrayList<Books> selectAllUserBook() {
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		Books resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select a.book_no, a.title, a.book_img,a.publication_date, b.code_value, c.nickname " + 
						"from books a, common b, member c " + 
						"where a.genre = b.code " + 
						"and a.member_no = c.member_no";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					resultVO = new Books();
					resultVO.setBook_no(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setBook_img(rs.getString(3));
					resultVO.setPublication_date(rs.getString(4));
					resultVO.setCode_value(rs.getString(5));
					resultVO.setWriter(rs.getString(6));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
	
	//유저들 쓴것들 랭킹별 리스트
	public ArrayList<Books> userBookRankList() {
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		Books resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select rownum, a.title, a.views, b.nickname " + 
						" from (select * from books order by views desc) a, member b " + 
						" where a.member_no = b.member_no";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					resultVO = new Books();
					resultVO.setNo(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setViews(rs.getString(3));
					resultVO.setWriter(rs.getString(4));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}

	
}
