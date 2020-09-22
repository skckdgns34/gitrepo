package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import vo.Books;
import vo.Company;
import vo.SearchBook;

public class MainDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;

	static MainDAO instance;

	public static MainDAO getInstance() {
		if (instance == null)
			instance = new MainDAO();
		return instance;
	}
	
	public ArrayList<SearchBook> searchBook(String a) {
		ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		try {
			SearchBook aa = null;
			conn = ConnectionManager.getConnnect();

			String sql = "select '책', title from books where title like '%' || ? || '%' " + " union all "
					+ " select '저자', writer from books where  writer like '%' || ? || '%' " + " union all "
					+ " select '출판사', company_name from company where  company_name like '%' || ? || '%' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, a);
			pstmt.setString(3, a);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				aa = new SearchBook();
				aa.setResult(rs.getString(1));
				aa.setTitle(rs.getString(2));

				list.add(aa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	

	public List<Map<String, Object>> searchBooksEqualTitle(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select book_no, title, writer, publication_date, book_img, company_name, introduction, summary,views,score ,genre "
					+ "from books where writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no",rs.getString("book_no"));
				map.put("title",rs.getString("title"));
				map.put("writer",rs.getString("writer"));
				map.put("publication_date",rs.getString("publication_date"));
				map.put("book_img",rs.getString("book_img"));
				map.put("company_name",rs.getString("company_name"));
				map.put("introduction",rs.getString("introduction"));
				map.put("summary",rs.getString("summary"));
				map.put("views",rs.getString("views"));
				map.put("score",rs.getString("score"));
				map.put("genre",rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}
	
	public ArrayList<Books> asdfsaf() {
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select writer from company";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				aa = new Books();
				aa.setTitle(rs.getString(1));
				list.add(aa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}
	public ArrayList<Books> asdfasdf() {
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select writer from company";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				aa = new Books();
				aa.setTitle(rs.getString(1));
				list.add(aa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}
	

}
