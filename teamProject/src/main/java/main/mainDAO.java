package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;

public class mainDAO
{	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static mainDAO instance;	
	public static mainDAO getInstance() {
		if (instance == null)
			instance = new mainDAO();
		return instance;
	}
	
	public void select() {
		
	}

	 public ArrayList<Books> selectAll() {
	      ArrayList<Books> list = new ArrayList<Books>();
	      Books resultVO = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT book_no, title, book_img "
	               + " FROM books ";         
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            resultVO = new Books();
	            resultVO.setBook_no(rs.getString(1));
	            resultVO.setTitle(rs.getString(2));
	            resultVO.setBook_img(rs.getString(3));
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
