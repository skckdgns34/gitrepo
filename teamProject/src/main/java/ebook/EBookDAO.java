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

public class EBookDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static EBookDAO instance;

	public static EBookDAO getInstance() {
		if (instance == null)
			instance = new EBookDAO();
		return instance;
	}

	public ArrayList<String> selectBookGenre() {
		ArrayList<String> list = new ArrayList<String>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select genre from books";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String result;
				result = rs.getString("genre");
				list.add(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	// 전자책 
	public ArrayList<Books> selectAllEBook(String genre) {
		Books resultVO = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img, writer, epub_path, genre from books where epub_path is not null and genre = ? order by 1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genre);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new Books();
				resultVO.setBook_no(rs.getString(1));
				resultVO.setTitle(rs.getString(2));
				resultVO.setBook_img(rs.getString(3));
				resultVO.setWriter(rs.getString(4));
				resultVO.setEpub_path(rs.getString(5));
				resultVO.setGenre(rs.getString(6));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	// 오디오 북
	public ArrayList<Books> selectAllAudioBook(String genre) {
		Books resultVO = null;
		ArrayList<Books> list = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, book_img, writer, audio_path, genre from books where audio_path is not null and genre = ? order by 1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genre);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new Books();
				resultVO.setBook_no(rs.getString(1));
				resultVO.setTitle(rs.getString(2));
				resultVO.setBook_img(rs.getString(3));
				resultVO.setWriter(rs.getString(4));
				resultVO.setAudio_path(rs.getString(5));
				resultVO.setGenre(rs.getString(6));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	

	//E-Book 검색 
	public ArrayList<SearchBook> searchBook(String a) {
		ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		try {
			SearchBook aa = null;
			conn = ConnectionManager.getConnnect();

			String sql = "select 'book', title from books where title like '%' || ? || '%' and epub_path is not null " + " union all "
					+ " select 'writer', writer from books where  writer like '%' || ? || '%' and epub_path is not null " + " union all "
					+ " select 'company', company_name from company c, books b where  c.company_name like '%' || ? || '%' and b.epub_path is not null ";
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
	
	
	

	//E-book검색해온 값이 뭔지 체크
	public List<Map<String, Object>> searchBooksEqualTitle(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select book_no, title, writer, publication_date, "
						+ " book_img, company_name, introduction, summary, "
						+ " views,score ,genre "
						+ " from books b, company c "
						+ " where b.company_code = c.company_code "
						+ " and b.title= ? "
						+ " and b.epub_path is not null";
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
	
	
	//E-Book 검색해온값이 출판사인지 체크
	public List<Map<String, Object>> searchBooksEqualCompany(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select book_no, title, writer, publication_date, "
						+ " book_img, company_name, introduction, summary, "
						+ " views,score ,genre "
						+ " from books b, company c "
						+ " where b.company_code = c.company_code "
						+ " and c.company_name= ?"
						+ "  and b.epub_path is not null ";
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
	
	
	//E-Book 검색해온값이 저자인지 체크
	public List<Map<String, Object>> searchBooksEqualWriter(String a) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			Books aa = null;
			conn = ConnectionManager.getConnnect();
			String sql ="select book_no, title, writer, publication_date, "
						+ " book_img, company_name, introduction, summary, "
						+ " views,score ,genre "
						+ " from books b, company c "
						+ " where b.company_code = c.company_code "
						+ " and b.writer= ? "
						+ " and b.epub_path is not null";
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
	
	
	
	
	
	
	
}
