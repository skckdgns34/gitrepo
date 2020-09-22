package bookManage;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionManager;
import vo.Books;

public class BookManageDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static BookManageDAO instance;
	public static BookManageDAO getInstance() {
		if(instance==null)
			instance=new BookManageDAO();
		return instance;
	}
	
	public Books insert (Books books) {
		Books resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'books'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			books.setBook_no(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'books'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into books (book_no, title, book_img, writer, publication_date, "
					+ "epub_path, audio_path, company_code, introduction, summary, best_book, registration_date)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, books.getBook_no());
			pstmt.setString(2, books.getTitle());
			pstmt.setString(3, books.getBook_img());
			pstmt.setString(4, books.getWriter());
			pstmt.setString(5, books.getPublication_date());
			pstmt.setString(6, books.getEpub_path());
			pstmt.setString(7, books.getAudio_path());
			pstmt.setString(8, books.getCompany_code());
			pstmt.setString(9, books.getIntroduction());
			pstmt.setString(10, books.getSummary());
			pstmt.setString(11, books.getBest_book());
			pstmt.executeUpdate();
			conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			ConnectionManager.close(conn);
		}
		return resultVO;
	}
}
