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
				String sql = "select a.book_no, a.title, a.book_img,a.publication_date, b.code_value, c.nickname, a.genre " + 
						"from books a, common b, member c " + 
						"where a.genre = b.code " + 
						"and a.member_no = c.member_no";
				if(genre!=null && !genre.equals("")) {
					sql+=" and a.genre='"+genre+"'";
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
				String sql = "select rownum, a.title, a.views, b.nickname, a.book_no " + 
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

	public void insertUserBook(Books book) {
		ResultSet rs = null;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			
			String seqSql = "select no from seq where tablename='books'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			String no = rs.getString(1);
			book.setBook_no(no);
			
			seqSql = "update seq set no = no + 1 where tablename='books'";
			stmt = conn.createStatement();
			stmt.execute(seqSql);
			
			String sql = "insert into books(book_no, title, writer, registration_date, introduction"
					+ ", summary, member_no, book_img, genre )"
					+ "values(?,?,?,sysdate,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBook_no());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getWriter());
			pstmt.setString(4, book.getIntroduction());
			pstmt.setString(5, book.getSummary());
			pstmt.setString(6, book.getMember_no());
			pstmt.setString(7, book.getBook_img());
			pstmt.setString(8, book.getGenre());
			int r = pstmt.executeUpdate();
			System.out.println(r+"책등록");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
	public void saveUserBook(Mywriting book) {
		ResultSet rs = null;
		try {
			
			conn = ConnectionManager.getConnnect();
			
			String sql = "insert into mywriting(member_no,my_title,my_write_date,genre,my_introduction"
					+ ",my_summary, image_uri,temporary_storage, my_contents)"
					+ "values(?,?,sysdate,?,?,?,?,'y',?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getMember_no());
			pstmt.setString(2, book.getMy_title());
			pstmt.setString(3, book.getGenre());
			pstmt.setString(4, book.getMy_introduction());
			pstmt.setString(5, book.getMy_summary());
			pstmt.setString(6, book.getImage_uri());
			pstmt.setString(7, book.getMy_contents());
			int r = pstmt.executeUpdate();
			System.out.println(r+"책등록");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
}
