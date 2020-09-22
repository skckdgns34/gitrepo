package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import vo.Books;
import vo.SearchBook;

public class MainDAO
{	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static MainDAO instance;	
	public static MainDAO getInstance() {
		if (instance == null)
			instance = new MainDAO();
		return instance;
	}
	
	public void a() { 
	List<Map<String, Object>> aaa =new ArrayList<Map<String, Object>>(); 
		
	}
	
	 public ArrayList<SearchBook> searchBook(String a){
		 ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		 try {
			 SearchBook aa =null;
	         conn = ConnectionManager.getConnnect();

	         String sql = "select 'book' as book, title from books where title like '%' || ? || '%' " + 
	         		" union all " + 
	         		" select 'wirter', writer from books where  writer like '%' || ? || '%' " + 
	         		" union all " + 
	         		" select 'company', company_name from company where  company_name like '%' || ? || '%' ";         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, a);
	         pstmt.setString(2, a);
	         pstmt.setString(3, a);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 aa=new SearchBook();
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
	 public ArrayList<Books> selectAllBook() {
		 Books resultVO = null;
			ArrayList<Books> list = new ArrayList<Books>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select book_no, title, book_img, writer from books ";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					resultVO = new Books();
					resultVO.setBook_no(rs.getString(1));
					resultVO.setTitle(rs.getString(2));
					resultVO.setBook_img(rs.getString(3));
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
