package company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Company;

public class CompanyDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static CompanyDAO instance;
	public static CompanyDAO getInstance() {
		if(instance==null)
			instance=new CompanyDAO();
		return instance;
	}
	
	public Company insert (Company company) {
		Company resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'company'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			company.setCompany_code(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'company'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into company (company_code, company_name, company_addr, company_mgr, company_tel, "
					+ "company_mgr_tel, company_account)"
					+ " values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, company.getCompany_code());
			pstmt.setString(2, company.getCompany_name());
			pstmt.setString(3, company.getCompany_addr());
			pstmt.setString(4, company.getCompany_mgr());
			pstmt.setString(5, company.getCompany_tel());
			pstmt.setString(6, company.getCompany_mgr_tel());
			pstmt.setString(7, company.getCompany_account());
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
	
	public int delete(Books book) {
		   int r = 0;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "DELETE BOOKS WHERE BOOK_NO = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, book.getBook_no());
	         r = pstmt.executeUpdate();
	         System.out.println(r+"건 삭제됨");
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(null, pstmt, conn);
	      }
	      return r;
	   }
	
	public Books selectOne(Books book) {
	      Books books = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT BOOK_NO, TITLE, BOOK_IMG, WRITER, PUBLICATION_DATE, EPUB_PATH,"
	         		  + " AUDIO_PATH, COMPANY_CODE, INTRODUCTION, SUMMARY, BEST_BOOK, genre, REGISTRATION_DATE"
	                  + " FROM BOOKS"
	                  + " WHERE BOOK_NO = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, book.getBook_no());
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 books = new Books();
	        	 books.setBook_no(rs.getString(1));
	        	 books.setTitle(rs.getString(2));
	        	 books.setBook_img(rs.getString(3));
	        	 books.setWriter(rs.getString(4));
	             books.setPublication_date(rs.getString(5));
	             books.setEpub_path(rs.getString(6));
	             books.setAudio_path(rs.getString(7));
	             books.setCompany_code(rs.getString(8));
	             books.setIntroduction(rs.getString(9));
	             books.setSummary(rs.getString(10));
	             books.setBest_book(rs.getString(11));
	             books.setGenre(rs.getString(12));
	             books.setRegistration_date(rs.getString(13));
	         } else {
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(rs, pstmt, conn);
	      }
	      return books;
	   }
	
	
	public ArrayList<Books> selectAll() {
	      ArrayList<Books> list = new ArrayList<Books>();
	      Books books = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT BOOK_NO, TITLE, WRITER, PUBLICATION_DATE, "
	         		+ "COMPANY_CODE, BEST_BOOK, genre, REGISTRATION_DATE "
	               + "FROM BOOKS ORDER BY 1";         
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	 books = new Books();
	             books.setBook_no(rs.getString(1));
	        	 books.setTitle(rs.getString(2));
	        	 books.setWriter(rs.getString(3));
	             books.setPublication_date(rs.getString(4));
	             books.setCompany_code(rs.getString(5));
	             books.setBest_book(rs.getString(6));
	             books.setGenre(rs.getString(7));
	             books.setRegistration_date(rs.getString(8));

	            list.add(books);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(rs, pstmt, conn);
	      }
	      return list;
	   }
	
	
	 public Books update(Books books) {
		  Books resultVO = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "UPDATE BOOKS SET TITLE=?, BOOK_IMG=?, WRITER=?, PUBLICATION_DATE=?, "
	         			+ "EPUB_PATH=?, AUDIO_PATH=?, COMPANY_CODE=?, INTRODUCTION=?, SUMMARY=?, BEST_BOOK=?, "
	         			+ "GENRE=? WHERE BOOK_NO = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, books.getTitle());
	         pstmt.setString(2, books.getBook_img());
	         pstmt.setString(3, books.getWriter());
	         pstmt.setString(4, books.getPublication_date());
	         pstmt.setString(5, books.getEpub_path());
	         pstmt.setString(6, books.getAudio_path());
	         pstmt.setString(7, books.getCompany_code());
	         pstmt.setString(8, books.getIntroduction());
	         pstmt.setString(9, books.getSummary());
	         pstmt.setString(10, books.getBest_book());
	         pstmt.setString(11, books.getGenre());
	         pstmt.setString(12, books.getBook_no());
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(null, pstmt, conn);
	      }
	      return resultVO;
	   }
}
