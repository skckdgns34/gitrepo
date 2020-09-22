package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import vo.SearchBook;

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
	
	public void a() { 
	List<Map<String, Object>> aaa =new ArrayList<Map<String, Object>>(); 
		
	}
	
	 public ArrayList<SearchBook> searchBook(String a){
		 ArrayList<SearchBook> list = new ArrayList<SearchBook>();
		 try {
			 SearchBook aa =null;
	         conn = ConnectionManager.getConnnect();

	         String sql = "select 'book' as book, title from books where  title like '%' || ? || '%' " + 
	         		" union all " + 
	         		" select 'wirter', writer from books where  writer like '%' || ? || '%' " + 
	         		" union all " + 
	         		" select 'company',company_name from company where  company_name like '%' || ? || '%' ";         
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
	 
}
