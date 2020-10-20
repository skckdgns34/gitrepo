package ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import main.MainDAO;
import vo.Books;
import vo.Mylibrary;
import vo.SearchBook;

public class AudioBookDAO {
	Connection conn = null;
	PreparedStatement pstmt;

	static AudioBookDAO instance;

	public static AudioBookDAO getInstance() {
		if (instance == null)
			instance = new AudioBookDAO();
		return instance;
	}

	
	public int allBooksCount() {
		int r = 0;
		ResultSet rs =null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(book_no) bookCount from books where audio_path is not null ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				r = rs.getInt("bookCount");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	// audio-Book detail 페이지에서 해당책 상세내용 뿌려주기용
	public ArrayList<Books> detailBook(String b) {
		ResultSet rs = null;
		ArrayList<Books> books = new ArrayList<Books>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select book_no, title, writer, publication_date,"
					+ " company_code, introduction, summary, views, best_book,genre,registration_date, book_img"
					+ " from books where book_no=" + b;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Books result = new Books();
				result.setBook_no(rs.getString(1));
				result.setTitle(rs.getString(2));
				result.setWriter(rs.getString(3));
				result.setPublication_date(rs.getString(4));
				result.setEpub_path(rs.getString(5));
				result.setIntroduction(rs.getString(6));
				result.setSummary(rs.getString(7));
				result.setViews(rs.getString(8));
				result.setBest_book(rs.getString(9));
				result.setGenre(rs.getString(10));
				result.setRegistration_date(rs.getString(11));
				result.setBook_img(rs.getString(12));
				books.add(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return books;
	}

	// audioBook detail 페이지에서 사용자가 audiobook 이용권이 있는지 없는지 체크
	public String checkTicket(Object a) {
		ResultSet rs = null;
		String list = "";
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select ticket_code from member m, pay p "
					+ " where m.member_no = p.member_no and rownum=1 and p.ticket_code in('g5','g6','g3','g4') "
					+ " and m.member_no= " + a;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				list = rs.getString("ticket_code");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 게시글 추천여부 검사
	public int recCheck(String a, String b) {
		ResultSet rs = null;
		int result = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(*) from good where book_no=? and member_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}

	public ArrayList<Map<String, Object>> genreCount() {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select genre, count(book_no) from books where audio_path is not null group by genre order by genre";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("genre", rs.getString(1));
				map.put("count", rs.getString(2));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// audiobook category 체크박스 전체 뿌려주기용
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

	// audioBook Category Ajax 장르라디오 체크시
	public ArrayList<Books> radioCheckGenre(String gen, int first, int last) {
		ArrayList<Books> list = new ArrayList<Books>();
		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select a.* from ( select rownum rn, b.* from (  "
					+ "select title, book_no, book_img from books where genre =? and audio_path is not null order by book_no desc "
					+ ") b ) a where rn  between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gen);
			pstmt.setInt(2, first);
			pstmt.setInt(3, last);
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
		ResultSet rs = null;
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
		ResultSet rs = null;
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
		ResultSet rs = null;
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
		ResultSet rs = null;
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

	public int count(String a) {
		int result = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(*) from books where genre = nvl(?,genre) and audio_path is not null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}




	public int myBookyn(Mylibrary my) {
		ResultSet rs = null;
		int result = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mylibrary_no from mylibrary where member_no=? and book_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, my.getMember_no());
			pstmt.setString(2, my.getBook_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}




	public void insertMylib(Mylibrary my) {
		ResultSet rs = null;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			String seqSql = "select no from seq where tablename='mylibrary'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			String no = rs.getString(1);
			my.setMylibrary_no(no);
			
			seqSql = "update seq set no = no + 1 where tablename='mylibrary'";
			stmt = conn.createStatement();
			stmt.execute(seqSql);
			
			String sql = "insert into mylibrary(mylibrary_no, member_no, book_no, wish, last_read_index)"
					+ "values(?,?,?,'y',null)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, my.getMylibrary_no());
			pstmt.setString(2, my.getMember_no());
			pstmt.setString(3, my.getBook_no());
			int r = pstmt.executeUpdate();
			System.out.println(r+"mylib등록");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}


	public List<Map<String, Object>> genreName() {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select code_value from common where common_name = '도서장르코드' order by code ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("genreName", rs.getString("code_value"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}


	public ArrayList<Map<String, Object>> genreCountName() {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select code, code_value from common where common_code = '0D' order by code";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("code", rs.getString("code"));
				map.put("code_value", rs.getString("code_value"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}


	public int genreAllCount() {
		int a = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(book_no) from books where audio_path is not null";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				a= rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return a;
	}


	public void updateViews(String book_no) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update books set views=views+1 where book_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_no);
			int r = pstmt.executeUpdate();
			System.out.println(r+"건 업뎃");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(conn);
		}
	}
}
