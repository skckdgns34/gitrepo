package createBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Mywriting;

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
	public ArrayList<Books> selectAllUserBook(String genre) {
		ResultSet rs = null;
		ArrayList<Books> list = new ArrayList<Books>();
		Books resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select a.book_no, a.title, a.book_img,a.publication_date, b.code_value, c.nickname, a.genre, nvl(a.views,0), nvl(d.cnt,0) review, summary " + 
						" from books a join common b " + 
						" on(a.genre = b.code) " + 
						" join member c " + 
						" on(a.member_no = c.member_no) " + 
						" left outer join (select a.book_no, count(*) cnt from books a, review b where a.book_no = b.book_no group by a.book_no) d " + 
						" on(a.book_no=d.book_no)";
				if(genre!=null && !genre.equals("") && !genre.equals("전체")) {
					sql+=" where a.genre='"+genre+"'";
				}
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
					resultVO.setGenre(rs.getString(7));
					resultVO.setViews(rs.getString(8));
					resultVO.setScore(rs.getString(9));
					resultVO.setSummary(rs.getString(10));
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
				String sql = "select rownum, a.title, a.views, b.nickname, a.book_no, a.book_img " + 
						" from (select * from books where views is not null order by views desc) a, member b " + 
						" where a.member_no = b.member_no and rownum<=5";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					resultVO = new Books();
					resultVO.setNo(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setViews(rs.getString(3));
					resultVO.setWriter(rs.getString(4));
					resultVO.setBook_no(rs.getString(5));
					resultVO.setBook_img(rs.getString(6));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
	
	
	//책 클릭한거 상세내용(일단)
	public Books selectedUserBook(String book_no) {
		ResultSet rs = null;
		Books resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select title, writer, publication_date, summary, views, book_img, genre from books where book_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book_no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resultVO = new Books();
					resultVO.setTitle(rs.getString(1));
					resultVO.setWriter(rs.getString(2));
					resultVO.setPublication_date(rs.getString(3));
					resultVO.setSummary(rs.getString(4));
					resultVO.setViews(rs.getString(5));
					resultVO.setBook_img(rs.getString(6));
					resultVO.setGenre(rs.getString(7));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
		return resultVO;
	}

	//상태 y로 바꿔주기
	public void updateUserBook(Mywriting book) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update mywriting set temporary_storage='y' where member_no=? and my_title=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getMember_no());
			pstmt.setString(2, book.getMy_title());
			int r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
	public void saveUserBook(Mywriting book) {
		ResultSet rs = null;
		int no = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			String chapsql = "select nvl(max(to_number(chapter)),0) from mywriting where member_no='"+book.getMember_no()+"'";
			if(book.getMy_title() != null && !book.getMy_title().equals("")) {
				chapsql+= " and my_title='"+book.getMy_title()+"'";
			}
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(chapsql);
			rs.next();
			no = rs.getInt(1)+1;
			book.setChapter(Integer.toString(no));
			
			String sql = "insert into mywriting(member_no,my_title,my_write_date,genre,my_introduction"
					+ ",my_summary, image_uri,temporary_storage, my_contents, chapter)"
					+ "values(?,?,sysdate,?,?,?,?,'n',?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getMember_no());
			pstmt.setString(2, book.getMy_title());
			pstmt.setString(3, book.getGenre());
			pstmt.setString(4, book.getMy_introduction());
			pstmt.setString(5, book.getMy_summary());
			pstmt.setString(6, book.getImage_uri());
			pstmt.setString(7, book.getMy_contents());
			pstmt.setString(8, book.getChapter());
			int r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}

	//유저 챕터 다 긁
	public ArrayList<Mywriting> selectAllChapter(String member_no, String my_title) {
		ResultSet rs = null;
		ArrayList<Mywriting> list = new ArrayList<Mywriting>();
		Mywriting resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select nvl(chapter,1),genre from mywriting where member_no=?";
			if(my_title != null && !my_title.equals("")) {
				sql += " and my_title='"+my_title+"'";
			}
			sql+=" order by 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVO = new Mywriting();
				resultVO.setChapter(rs.getString(1));
				resultVO.setGenre(rs.getString(2));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public int myBookMaxChapter(String member_no, String my_title) {
		int r = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select max(chapter) from mywriting where member_no=?";
			if(my_title != null && !my_title.equals("")) {
				sql += " and my_title='"+my_title+"'";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				r = rs.getInt(1)+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
		
	}

	public Mywriting myBookDetail(Mywriting m_book) {
		Mywriting book = new Mywriting();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select member_no, my_title, my_write_date, genre, my_introduction,"
					+ " my_summary, image_uri, score, views, temporary_storage, my_contents, chapter "
					+ " from mywriting "
					+ " where member_no = ? and my_title = ? and chapter = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_book.getMember_no());
			pstmt.setString(2, m_book.getMy_title());
			pstmt.setString(3, m_book.getChapter());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				book.setMember_no(rs.getString(1));
				book.setMy_title(rs.getString(2));
				book.setMy_write_date(rs.getString(3));
				book.setGenre(rs.getString(4));
				book.setMy_introduction(rs.getString(5));
				book.setMy_summary(rs.getString(6));
				book.setImage_uri(rs.getString(7));
				book.setScore(rs.getString(8));
				book.setViews(rs.getString(9));
				book.setTemporary_storage(rs.getString(10));
				book.setMy_contents(rs.getString(11));
				book.setChapter(rs.getString(12));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return book;
	}

	//글 수정하면 바꿔주기
	public void updateUserBookDetail(Mywriting book) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update mywriting "
					+ " set my_write_date=sysdate, my_summary=?,"
					+ " my_introduction=?, my_contents=?"
					+ " where member_no=? and my_title=? and chapter=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getMy_summary());
			pstmt.setString(2, book.getMy_introduction());
			pstmt.setString(3, book.getMy_contents());
			pstmt.setString(4, book.getMember_no());
			pstmt.setString(5, book.getMy_title());
			pstmt.setString(6, book.getChapter());
			int r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}

	public ArrayList<String> selectAllTitle() {
		ArrayList<String> list = new ArrayList<String>();
		ResultSet rs = null;
		String result = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select title from books";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
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
