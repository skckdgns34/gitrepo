package ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import main.MainDAO;
import vo.Books;
import vo.SearchBook;

public class AudioBookDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;

	static AudioBookDAO instance;

	public static AudioBookDAO getInstance() {
		if (instance == null)
			instance = new AudioBookDAO();
		return instance;
	}

	// ebook category 체크박스 전체 뿌려주기용
	public ArrayList<Books> raidoAllBooks(int first, int last) {
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select a.* from ( select rownum rn, b.* from (  "
					+ "select title, book_no, book_img from books where audio_path is not null order by book_no desc "
					+ ") b ) a where rn  between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, first);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Books books = new Books();
				books.setTitle(rs.getString("title"));
				books.setBook_no(rs.getString("book_no"));
				books.setBook_img(rs.getString("book_img"));
				list.add(books);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// eBook Category Ajax 장르라디오 체크시
		public ArrayList<Books> radioCheckGenre(String gen, int first, int last)
		{
			ArrayList<Books> list = new ArrayList<Books>();
			ResultSet rs = null;

			try
			{
				conn = ConnectionManager.getConnnect();
				String sql = "select a.* from ( select rownum rn, b.* from (  " + 
						"select title, book_no, book_img from books where genre =? and audio_path is not null order by book_no desc "
						+ ") b ) a where rn  between ? and ? "; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, gen);
				pstmt.setInt(2, first);
				pstmt.setInt(3, last);
				rs = pstmt.executeQuery();
				while (rs.next())
				{
					Books books = new Books();
					books.setTitle(rs.getString("title"));
					books.setBook_no(rs.getString("book_no"));
					books.setBook_img(rs.getString("book_img"));
					list.add(books);
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			} finally
			{
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
	
	// 베스트셀러인거만 가져오기
	public ArrayList<Books> selectBestBooks() {
		ArrayList<Books> list = new ArrayList<Books>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img from books where best_book='y' and rownum<6 and audio_path is not null order by book_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Books books = new Books();
				books.setBook_no(rs.getString(1));
				books.setTitle(rs.getString(2));
				books.setBook_img(rs.getString(3));
				list.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 오디오북 검색
	public ArrayList<SearchBook> searchBook(String a) {
		ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		try {
			SearchBook aa = null;
			conn = ConnectionManager.getConnnect();

			String sql = "select 'book', title from books where title like '%' || ? || '%' and audio_path is not null "
					+ " union all "
					+ " select 'writer', writer from books where  writer like '%' || ? || '%' and audio_path is not null "
					+ " union all "
					+ " select 'company', company_name from company c, books b where  company_name like '%' || ? || '%' and b.audio_path is not null";
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
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, " + " views,score ,genre "
					+ " from books b, company c " + " where b.company_code = c.company_code " + " and b.title= ? "
					+ " and b.audio_path is not null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public List<Map<String, Object>> searchBooksEqualCompany(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, " + " views,score ,genre "
					+ " from books b, company c " + " where b.company_code = c.company_code " + " and c.company_name= ?"
					+ "	and b.audio_path is not null ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public List<Map<String, Object>> searchBooksEqualWriter(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date, "
					+ " book_img, company_name, introduction, summary, " + " views,score ,genre "
					+ " from books b, company c " + " where b.company_code = c.company_code " + " and b.writer= ?"
					+ " and b.audio_path is not null ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("book_no", rs.getString("book_no"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("publication_date", rs.getString("publication_date"));
				map.put("book_img", rs.getString("book_img"));
				map.put("company_name", rs.getString("company_name"));
				map.put("introduction", rs.getString("introduction"));
				map.put("summary", rs.getString("summary"));
				map.put("views", rs.getString("views"));
				map.put("score", rs.getString("score"));
				map.put("genre", rs.getString("genre"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
